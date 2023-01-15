return {
  -- Install your plugins here
  { "folke/lazy.nvim", tag = "stable" },
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },
  { "kyazdani42/nvim-web-devicons" },
  { "akinsho/bufferline.nvim" },
  { "moll/vim-bbye" },
  { "nvim-lualine/lualine.nvim" },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
  },
  { "ahmedkhalf/project.nvim" },
  { "lewis6991/impatient.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "goolord/alpha-nvim" },
  { "folke/which-key.nvim" },
  { "karb94/neoscroll.nvim" },
  { "folke/zen-mode.nvim" },

  -- File Explorer
  { "kyazdani42/nvim-tree.lua" },
  { "tamago324/lir.nvim" },

  -- Colorschemes
  { "folke/tokyonight.nvim" },
  { "lunarvim/darkplus.nvim" },
  { "folke/todo-comments.nvim" },

  -- Cmp
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
  }, --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use

  -- LSP
  { "neovim/nvim-lspconfig" }, -- enable LSP
  { "williamboman/mason.nvim" }, -- simple to use language server installer
  { "williamboman/mason-lspconfig.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
  { "j-hui/fidget.nvim" },
  { "lvimuser/lsp-inlayhints.nvim" },
  { "RRethy/vim-illuminate" },

  -- Telescope
  { "nvim-telescope/telescope.nvim" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
  },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Code Runner
  { "is0n/jaq-nvim" },
  {
    "0x100101/lab.nvim",
    run = "cd js && npm ci",
  },

  -- Motion
  {
    "phaazon/hop.nvim",
    event = "BufRead",
  },
}
