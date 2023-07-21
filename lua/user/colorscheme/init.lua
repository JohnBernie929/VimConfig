local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end

if colorscheme == "neosolarized" then
  require("user.colorscheme.neosolarized")
elseif colorscheme == "onedark" then
  require("user.colorscheme.onedark")
end

vim.api.nvim_set_hl(0, "Folded", { link = "CursorLine" })
