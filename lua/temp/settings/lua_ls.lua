return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			library = vim.api.nvim_get_runtime_file("", true),
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
