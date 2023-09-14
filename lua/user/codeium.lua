local opts = { expr = true, silent = true, noremap = true }

vim.keymap.set("i", "<C-a>", function()
  return vim.fn["codeium#Accept"]()
end, opts)
vim.keymap.set("i", "<C-.>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, opts)
vim.keymap.set("i", "<C-,>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, opts)
vim.keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, opts)
