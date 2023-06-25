-- [[ nvim/lua/plugins/lsp/handlers.lua ]]

local M = {}

local lsp_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_ok then
	return
end
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_ok then
	return
end

local lsp_defaults = lspconfig.util.default_config

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
lsp_defaults.capabilities = vim.tbl_deep_extend("force", lsp_defaults.capabilities, cmp_nvim_lsp.default_capabilities())
-- M.capabilities.textDocument.completion.completionItem.snippetSupport = true

require("plugins.lsp.keybindings")

M.on_attach = function(client, bufnr)
	-- load lsp keymaps
	require("plugins.lsp.keymaps").lsp_keymaps(bufnr)

	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
		buffer = bufnr,
		callback = function()
			vim.lsp.buf.format({
				filter = function()
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end,
	})
end

return M

-- vim: ts=2 sts=2 sw=2 et
