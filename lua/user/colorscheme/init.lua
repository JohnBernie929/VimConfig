local colorscheme = "everforest"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end

require("user.colorscheme." .. colorscheme)

vim.api.nvim_set_hl(0, "Folded", { link = "CursorLine" })
