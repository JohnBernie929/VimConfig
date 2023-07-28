local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

onedark.setup {
  style = "darker",
  transparent = false,
}

onedark.load()

vim.api.nvim_set_hl(0, "Visual", { bg = "#3E4452" })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "#282c34" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#282c34" })
