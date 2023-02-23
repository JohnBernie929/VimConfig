local ok, cybu = pcall(require, "cybu")
if not ok then
  return
end

local colors_name = vim.g.colors_name
local colors = {
  fg = "#c0caf5",
  fg_alt = "#7aa2f7",
  bg = "#1a1b26",
  bg_alt = "#292e42",
}

if colors_name == "tokyonight" then
  colors = {
    fg = "#c0caf5",
    fg_alt = "#7aa2f7",
    bg = "#1a1b26",
    bg_alt = "#292e42",
  }
end

vim.api.nvim_set_hl(0, "CybuFocus", { fg = colors.fg_alt, bg = colors.bg_alt })
vim.api.nvim_set_hl(0, "CybuAdjacent", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "CybuBackground", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "CybuBorder", { fg = colors.fg_alt, bg = colors.bg })

cybu.setup {
  position = {
    relative_to = "win", -- win, editor, cursor
    anchor = "topright", -- topleft, topcenter, topright,
    -- centerleft, center, centerright,
    -- bottomleft, bottomcenter, bottomright
    -- vertical_offset = 10, -- vertical offset from anchor in lines
    -- horizontal_offset = 0, -- vertical offset from anchor in columns
    -- max_win_height = 5, -- height of cybu window in lines
    -- max_win_width = 0.5, -- integer for absolute in columns
    -- float for relative to win/editor width
  },
  display_time = 1750, -- time the cybu window is displayed
  style = {
    path = "relative", -- absolute, relative, tail (filename only)
    border = "rounded", -- single, double, rounded, none
    separator = " ", -- string used as separator
    prefix = "…", -- string used as prefix for truncated paths
    padding = 1, -- left & right padding in number of spaces
    hide_buffer_id = true,
    devicons = {
      enabled = true, -- enable or disable web dev icons
      colored = true, -- enable color for web dev icons
      truncate = true, -- truncate wide icons to one char width
    },
    highlights = { -- see highlights via :highlight
      current_buffer = "CybuFocus", -- current / selected buffer
      adjacent_buffers = "CybuAdjacent", -- buffers not in focus
      background = "CybuBackground", -- window background
      border = "CybuBorder", -- border of the window
    },
  },
  behavior = { -- set behavior for different modes
    mode = {
      default = {
        switch = "immediate", -- immediate, on_close
        view = "paging", -- paging, rolling
      },
      last_used = {
        switch = "on_close", -- immediate, on_close
        view = "paging", -- paging, rolling
      },
      auto = {
        view = "rolling", -- paging, rolling
      },
    },
    show_on_autocmd = false, -- event to trigger cybu (eg. "BufEnter")
  },
}
-- vim.keymap.set("n", "<up>", "<Plug>(CybuPrev)")
-- vim.keymap.set("n", "<down>", "<Plug>(CybuNext)")
vim.keymap.set("n", "<C-h>", "<Plug>(CybuPrev)")
vim.keymap.set("n", "<C-l>", "<Plug>(CybuNext)")
