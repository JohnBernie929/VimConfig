local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

local hooks = require "ibl.hooks"

local highlight = {
  "IBLIndent1",
  "IBLIndent2",
  "IBLIndent3",
}

local hlIndent = {
  "IblScope"
}

vim.g.indent_blankline_context_patterns = {
  "class",
  "return",
  "function",
  "method",
  "^if",
  "^while",
  "jsx_element",
  "^for",
  "^object",
  "^table",
  "block",
  "arguments",
  "if_statement",
  "else_clause",
  "jsx_element",
  "jsx_self_closing_element",
  "try_statement",
  "catch_clause",
  "import_statement",
  "operation_type",
}
-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "space:"
-- vim.opt.listchars:append "eol:↴"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.cmd [[highlight IBLIndent1 guifg=#E06C75 gui=nocombine]]
  vim.cmd [[highlight IBLIndent2 guifg=#E5C07B gui=nocombine]]
  vim.cmd [[highlight IBLIndent3 guifg=#98C379 gui=nocombine]]
  vim.cmd [[highlight IBLIndent4 guifg=#56B6C2 gui=nocombine]]
  vim.cmd [[highlight IBLIndent5 guifg=#61AFEF gui=nocombine]]
  vim.cmd [[highlight IBLIndent6 guifg=#C678DD gui=nocombine]]
end)

vim.g.rainbow_delimiters = { highlight = highlight }

ibl.setup {
  indent = {
    highlight = hlIndent,
    char = "│",
    -- char = "▏",
    -- char = "▎",
  },
  scope = {
    highlight = highlight,
  },
  exclude = {
    filetypes = { "help", "startify", "dashboard", "packer", "neogitstatus", "NvimTree", "Trouble" },
    buftypes = { "terminal", "nofile" },
  },
}
