local lsp_servers = {
	"pyright",
	"lua_ls",
}

return {
	{
		"williamboman/mason",
		opts = {
			ui = { border = "rounded" },
		},
	},

	{
		"williamboman/mason-lspconfig",
		opts = {
			ensure_installed = lsp_servers,
			automatic_installation = true,
		},
		config = function()
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup_handlers({
				function(server)
					-- See :help lspconfig-setup
					lspconfig[server].setup({})
				end,
				["Lua"] = function()
					lspconfig.Lua.setup({
						settings = {
							diagnostics = {
								globals = { "vim" },
							},
							library = vim.api.nvim_get_runtime_file("", true),
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						},
					})
				end,
				["pyright"] = function()
					lspconfig.pyright.setup({
						settings = {
							python = {
								analysis = {
									typeCheckingMode = "off",
								},
							},
						},
					})
				end,
			})
		end,
	},
}
