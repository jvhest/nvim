-- Here we declare the setup function and add the modifications in signs and extra configs,
-- like virtual text, false update_in_insert, rounded borders for float windows, etc.
local signs = {
	-- change the "?" to an icon that you like
	{ name = "DiagnosticSignError", text = "✘" },
	{ name = "DiagnosticSignWarn", text = "▲" },
	{ name = "DiagnosticSignHint", text = "⚑" },
	{ name = "DiagnosticSignInfo", text = "»" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
		-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
		-- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
		-- prefix = "icons",
	},
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = false,
	underline = true,
	severity_sort = true,
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
