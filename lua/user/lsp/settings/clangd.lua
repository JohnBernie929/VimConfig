local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

return {
  cmd = { "C:\\MinGW\\bin\\clangd.exe" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}
