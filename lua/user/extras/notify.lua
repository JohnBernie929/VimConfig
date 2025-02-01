local M = {
  "rcarriga/nvim-notify",
}

function M.config()
  vim.notify = require "notify"
  vim.notify.setup {
    background_colour = "#000000",
  }
end

return M
