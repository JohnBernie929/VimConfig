return {
	settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = {
          [vim.fn.expand("$HOME/AppData/Local/nvim/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },

    python = {
      analysis = {
        typeCheckingMode = "off"
      }
    }
	},
}
