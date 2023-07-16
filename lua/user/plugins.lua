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
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
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
  },
  { "folke/which-key.nvim", event = "VeryLazy" },
  { "karb94/neoscroll.nvim" },
  { "folke/zen-mode.nvim" },
  { "nacro90/numb.nvim" },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },

  -- File Explorer
  { "kyazdani42/nvim-tree.lua", event = "User DirOpened" },
  { "tamago324/lir.nvim", event = "User DirOpened" },

  -- Colorschemes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "lunarvim/darkplus.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    priority = 1000,
  },
  {
    "svrana/NeoSolarized.nvim",
    lazy = false,
    dependencies = { "tjdevries/colorbuddy.nvim" },
  },

  -- Color
  { "NvChad/nvim-colorizer.lua" },
  { "nvim-colortils/colortils.nvim" },

  -- Utility
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    lazy = true,
  },
  { "rcarriga/nvim-notify" },
  { "roobert/search-replace.nvim" },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
  },
  { "nvim-neorg/neorg" },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
  },

  {
    "ghillb/cybu.nvim",
    event = "User FileOpened",
    lazy = true,
    enabled = false,
  },
  {
    "rest-nvim/rest.nvim",
  },

  -- Cmp
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
  }, -- The completion plugin
  { "hrsh7th/cmp-buffer", lazy = true }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "saadparwaiz1/cmp_luasnip", lazy = true }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-nvim-lua", lazy = true },
  { "roobert/tailwindcss-colorizer-cmp.nvim" },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    lazy = true,
  }, --snippet engine
  {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
    lazy = true,
  }, -- a bunch of snippets to use

  -- LSP
  { "neovim/nvim-lspconfig", lazy = true }, -- enable LSP
  { "williamboman/mason.nvim", lazy = true }, -- simple to use language server installer
  { "williamboman/mason-lspconfig.nvim", lazy = true },
  { "jose-elias-alvarez/null-ls.nvim", lazy = true }, -- for formatters and linters
  { "j-hui/fidget.nvim" },
  { "lvimuser/lsp-inlayhints.nvim", lazy = true },
  { "RRethy/vim-illuminate", event = "User FileOpened" },
  { "SmiteshP/nvim-navic", event = "User FileOpened" },
  { "Exafunction/codeium.vim" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- Treesitter
  { "nvim-treesitter/nvim-treesitter" },
  { "windwp/nvim-ts-autotag" },
  { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Editing Support
  { "monaqa/dial.nvim" },

  -- Code Runner
  { "is0n/jaq-nvim" },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
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

  -- Handlebars
  -- { "mustache/vim-mustache-handlebars" },
}, {
  ui = {
    border = "rounded",
  },
})
