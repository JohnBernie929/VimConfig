local M = {
  "CRAG666/code_runner.nvim",
  event = "VeryLazy",
}

function M.config()
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("n", "<m-r>", ":RunCode<cr>", opts)
  keymap("n", "<M-C-n>", ":RunCode<cr>", opts)

  require("code_runner").setup {
    startinsert = true,

    filetype = {
      cpp = {
        "cd $dir &&",
        "g++ -std=c++14 -pipe -O2 -s -static -lm -x c++ $fileName -o $fileNameWithoutExt.bin &&",
        "$dir/$fileNameWithoutExt.bin",
      },
    },
  }
end

return M
