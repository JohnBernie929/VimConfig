local _, navbuddy = pcall(require, "nvim-navbuddy")
if not _ then
  return
end

navbuddy.setup {
  window = {
    border = "rounded",
  },
  icons = require("user.icons").kind,
  lsp = { auto_attach = true },
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-M-s>", ":silent only | Navbuddy<cr>", opts)
keymap("n", "<C-M-o>", ":silent only | Navbuddy<cr>", opts)
