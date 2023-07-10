local status_ok, rest = pcall(require, "rest-nvim")
if not status_ok then
	return
end

local status_ok_wk, which_key = pcall(require, "which-key")
if not status_ok_wk then
	return
end

rest.setup({
	-- Open request results in a horizontal split
	result_split_horizontal = false,
	-- Keep the http file buffer above|left when split horizontal|vertical
	result_split_in_place = false,
	-- Skip SSL verification, useful for unknown certificates
	skip_ssl_verification = true,
	-- Encode URL before making request
	encode_url = true,
	-- Highlight request on run
	highlight = {
		enabled = true,
		timeout = 150,
	},
	result = {
		-- toggle showing URL, HTTP info, headers at top the of result window
		show_url = true,
		-- show the generated curl command in case you want to launch
		-- the same request via the terminal (can be verbose)
		show_curl_command = false,
		show_http_info = true,
		show_headers = true,
		-- executables or functions for formatting response body [optional]
		-- set them to false if you want to disable them
		formatters = {
			json = "jq",
			html = function(body)
				return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
			end,
		},
	},
	-- Jump to request line on run
	jump_to_request = false,
	env_file = ".env",
	custom_dynamic_variables = {},
	yank_dry_run = true,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "http",
	callback = function()
		local buff = tonumber(vim.fn.expand("<abuf>"), 10)
		local opts = {
			mode = "n", -- NORMAL mode
			prefix = "<leader>",
			buffer = buff, -- Global mappings. Specify a buffer number for buffer local mappings
			silent = true, -- use `silent` when creating keymaps
			noremap = true, -- use `noremap` when creating keymaps
			nowait = true, -- use `nowait` when creating keymaps
		}

		local mappings = {
			r = {
				name = "Rest",
				r = { "<Plug>RestNvim", "Rest Run" },
				p = { "<Plug>RestNvimPreview", "Rest Preview" },
				l = { "<Plug>RestNvimLast", "Rest Last" },
			},
		}

		which_key.register(mappings, opts)
	end,
})
