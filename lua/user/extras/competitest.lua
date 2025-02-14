local M = {
  "xeluxee/competitest.nvim",
  dependencies = "MunifTanjim/nui.nvim",
}

function M.config()
  require("competitest").setup {
    testcases_directory = "./.tc",
    maximum_time = 2000,
    testcases_use_single_file = true,
    compile_command = {
      c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT).bin" } },
      cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT).bin" } },
    },
    run_command = {
      cpp = { exec = "./$(FNOEXT).bin" },
    },
  }

  local wk = require "which-key"
  wk.add {
    {
      "<leader>C",
      group = "CompetiTest",
    },
    {
      "<leader>Cr",
      cmd = ":CompetiTest run<cr>",
      desc = "Run Testcase",
    },
    {
      "<leader>Ca",
      cmd = ":CompetiTest add_testcase<cr>",
      desc = "Add Testcase",
    },
    {
      "<leader>Ce",
      cmd = ":CompetiTest edit_testcase<cr>",
      desc = "Edit Testcase",
    },
  }

  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("n", "<M-C-b>", ":CompetiTest run<cr>", opts)
end

return M
