local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  autopairs = {
		enable = true,
	},
  indent = { enable = true, disable = { "yaml", "python", "css" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
		enable = true,
		disable = { "xml" },
	},
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = {
      "#E06C75",
      "#E5C07B",
      "#98C379",
      "#56B6C2",
      "#61AFEF",
      "#C678DD"
    },
    disable = { "html" }
  },
    playground = {
		enable = true,
	},
}
