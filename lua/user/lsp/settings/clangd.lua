local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

return {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {
    clangd = {
      includePaths = {
        "C:/MinGW/include",
        "C:/MinGW/include/c++/12.3.0",
      },
    },
  },
}
