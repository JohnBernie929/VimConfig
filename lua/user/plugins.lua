-- Automatically install Lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd([[
--augroup packer_user_config
--autocmd!
--autocmd BufWritePost plugins.lua source <afile> | PackerSync
--augroup end
--]])

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup({
  -- Install your plugins here
  { "folke/lazy.nvim", tag = "stable" },
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    event = "User FileOpened",
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  { "kyazdani42/nvim-web-devicons", lazy = true },
  {
    "akinsho/bufferline.nvim",
    event = "User FileOpened",
    enabled = true,
  },
  { "moll/vim-bbye" },
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      require "user.lualine"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
      require "user.toggleterm"
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    event = "VimEnter",
  },
  { "lewis6991/impatient.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require "user.alpha"
    end,
  },
  { "folke/which-key.nvim", event = "VeryLazy" },
  { "karb94/neoscroll.nvim" },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    config = function()
      require "user.zen-mode"
    end,
    lazy = true,
  },
  { "nacro90/numb.nvim" },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
    config = function()
      local _, nvimtree = pcall(require, "nvim-tree")
      if not _ then
        return
      end

      local setup = require "user.nvim-tree"
      nvimtree.setup(setup)
    end,
  },
  {
    "tamago324/lir.nvim",
    event = "User DirOpened",
    config = function()
      require "user.lir"
    end,
  },

  -- Colorschemes
  { "folke/tokyonight.nvim", lazy = false },
  { "lunarvim/darkplus.nvim" },
  { "folke/todo-comments.nvim", event = "BufRead" },
  {
    "svrana/NeoSolarized.nvim",
    dependencies = { "tjdevries/colorbuddy.nvim" },
  },
  { "neanias/everforest-nvim", lazy = false },

  -- Color
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require "user.colorizer"
    end,
  },
  { "nvim-colortils/colortils.nvim" },

  -- Utility
  { "stevearc/dressing.nvim" },
  { "rcarriga/nvim-notify" },
  { "roobert/search-replace.nvim" },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
  },
  { "rest-nvim/rest.nvim" },

  {
    "ghillb/cybu.nvim",
    event = "User FileOpened",
    config = function()
      require "user.cybu"
    end,
    lazy = true,
    enabled = false,
  },

  -- Cmp
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "chrisgrieser/cmp-nerdfont" },
  { "hrsh7th/cmp-emoji" },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    lazy = true,
  }, --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

  -- LSP
  { "neovim/nvim-lspconfig", lazy = true }, -- enable LSP
  { "williamboman/mason.nvim", lazy = true }, -- simple to use language server installer
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  { "jose-elias-alvarez/null-ls.nvim", lazy = true }, -- for formatters and linters
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    config = function()
      require "user.fidget"
    end,
    enabled = true,
  },
  { "lvimuser/lsp-inlayhints.nvim", lazy = true },
  {
    "RRethy/vim-illuminate",
    event = "User FileOpened",
    lazy = true,
  },
  { "SmiteshP/nvim-navic", event = "User FileOpened" },
  {
    "Exafunction/codeium.vim",
    config = function()
      require "user.codeium"
    end,
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      { "windwp/nvim-ts-autotag" },
      { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
    },
  },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Editing Support
  {
    "monaqa/dial.nvim",
    config = function()
      require "user.dial"
    end,
  },
  {
    "0x100101/lab.nvim",
    build = "cd js && npm ci",
    config = function()
      require "user.lab"
    end,
  },

  -- Code Runner
  { "is0n/jaq-nvim" },

  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },

  -- Motion
  {
    "phaazon/hop.nvim",
    event = "BufRead",
  },

  -- Clangd/C++/C
  {
    "cdelledonne/vim-cmake",
  },
}, {
  ui = {
    border = "rounded",
  },
})
