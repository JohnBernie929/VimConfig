return {
  -- Install your plugins here
  { "folke/lazy.nvim", tag = "stable" },
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
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
    enabled = false,
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

  -- File Explorer
  { "kyazdani42/nvim-tree.lua", event = "User DirOpened" },
  { "tamago324/lir.nvim", event = "User DirOpened" },

  -- Colorschemes
  { "folke/tokyonight.nvim", lazy = false },
  { "lunarvim/darkplus.nvim" },
  { "folke/todo-comments.nvim", event = "BufRead" },

  -- Color
  { "NvChad/nvim-colorizer.lua" },
  { "nvim-colortils/colortils.nvim" },

  -- Utility
  { "stevearc/dressing.nvim" },
  { "rcarriga/nvim-notify" },
  {
    "ghillb/cybu.nvim",
    event = "User FileOpened",
    lazy = true,
  },

  -- Cmp
  { "hrsh7th/nvim-cmp", lazy = true }, -- The completion plugin
  { "hrsh7th/cmp-buffer", lazy = true }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "saadparwaiz1/cmp_luasnip", lazy = true }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-nvim-lua", lazy = true },

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
  { "j-hui/fidget.nvim" },
  { "lvimuser/lsp-inlayhints.nvim", lazy = true },
  { "RRethy/vim-illuminate", event = "User FileOpened" },
  { "SmiteshP/nvim-navic", event = "User FileOpened" },
  { "Exafunction/codeium.vim" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
  },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Editing Support
  { "monaqa/dial.nvim" },

  -- Code Runner
  { "is0n/jaq-nvim" },
  {
    "0x100101/lab.nvim",
    build = "cd js && npm ci",
  },

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
}
