local M = {
  "CRAG666/code_runner.nvim",
}

M.config = function()
  require("code_runner").setup {
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
        "g++ $fileName -o $fileNameWithoutExt &&",
        "$dir/$fileNameWithoutExt",
      },
    },
  }
end

return M
