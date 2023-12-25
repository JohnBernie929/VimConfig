local _, code_runner = pcall(require, "code_runner")
if not _ then
  return
end

code_runner.setup {
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
    }
  },
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<m-r>", ":RunCode<cr>", opts)
