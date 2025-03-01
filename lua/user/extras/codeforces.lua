local M = {
  "yunusey/codeforces-nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

function M.config()
  require("codeforces-nvim").setup {
    use_term_toggle = true,
    cf_path = "/home/ajitana/workspace/codeforces",
    timeout = 15000,
    compiler = {
      cpp = { "g++", "@.cpp", "-o", "@" },
      py = {},
    },
    run = {
      cpp = { "@" },
      py = { "python3", "@.py" },
    },
    notify = function(title, message, type)
      local notify = require "notify"
      if message == nil then
        notify(title, type, {
          render = "minimal",
        })
      else
        notify(message, type, {
          title = title,
        })
      end
    end,
  }
end

return M
