require("plugins.lsp.diagnostics")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_cmds", { clear = true }),
	desc = "LSP actions",
	callback = function()
		require("plugins.lsp.keybindings")
	end,
})

require("plugins.lsp.autoformat")
