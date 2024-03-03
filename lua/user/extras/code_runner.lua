local M = {
  "CRAG666/code_runner.nvim",
}

M.config = function()
  require("code_runner").setup {
    term = {
      size = 4,
    },
    startinsert = true,
    filetype = {
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt",
      },
      python = "python3 -u",
      typescript = "deno run",
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt",
      },
      cpp = {
        "cd $dir &&",
        "g++ -std=c++14 $fileName -pipe -O2 -s -static -lm -x c++ -o $fileNameWithoutExt &&",
        "$dir/$fileNameWithoutExt",
      },
    },
  }
end

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<M-C-n>", ":RunCode<cr>", opts)

return M
