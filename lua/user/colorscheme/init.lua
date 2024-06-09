-- local colorscheme = "tokyonight-night"
-- local colorscheme = "primer_dark"
-- local colorscheme = "darkplus"
local colorscheme = "everforest"
-- local colorscheme = "neosolarized"
-- local colorscheme = "catppuccin-mocha"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  print("colorscheme " .. colorscheme .. " not found")
  return
end

if not pcall(require, "user.colorscheme." .. colorscheme) then
  return
end

vim.api.nvim_set_hl(0, "Folded", { link = "CursorLine" })
