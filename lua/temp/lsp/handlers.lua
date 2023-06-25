require("plugins.lsp.diagnostics")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user_cmds", { clear = true }),
	desc = "LSP actions",
	callback = function()
		require("plugins.lsp.keybindings")
	end,
})

require("plugins.lsp.autoformat")

-- Create a command `:Format` local to the LSP buffer
vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
	vim.lsp.buf.format()
end, { desc = "Format current buffer with LSP" })
