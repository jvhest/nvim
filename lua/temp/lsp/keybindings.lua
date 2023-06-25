vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = true, desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = true, desc = "[C]ode [A]ction" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { buffer = true, desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = true, desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = true, desc = "Type [D]efinition" })
vim.keymap.set(
	"n",
	"<leader>ds",
	require("telescope.builtin").lsp_document_symbols,
	{ buffer = true, desc = "[D]ocument [S]ymbols" }
)
vim.keymap.set(
	"n",
	"<leader>ws",
	require("telescope.builtin").lsp_dynamic_workspace_symbols,
	{ buffer = true, desc = "[W]orkspace [S]ymbols" }
)

-- See `:help K` for why this keymap
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true, desc = "Hover Documentation" })
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = true, desc = "Signature Documentation" })

-- Lesser used LSP functionality
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = true, desc = "[G]oto [D]eclaration" })
vim.keymap.set(
	"n",
	"<leader>wa",
	vim.lsp.buf.add_workspace_folder,
	{ buffer = true, desc = "[W]orkspace [A]dd Folder" }
)
vim.keymap.set(
	"n",
	"<leader>wr",
	vim.lsp.buf.remove_workspace_folder,
	{ buffer = true, desc = "[W]orkspace [R]emove Folder" }
)
vim.keymap.set("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { buffer = true, desc = "[W]orkspace [L]ist Folders" })
