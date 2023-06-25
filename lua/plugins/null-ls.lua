-- formatters and linters [ null-ls]]
--
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		local nls = require("null-ls")
		local formatting = nls.builtins.formatting
		local diagnostics = nls.builtins.diagnostics
		return {
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
			debug = false,
			sources = {
				-- Bash
				formatting.prettier.with({
					extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
				}),
				-- Shell
				formatting.shfmt,
				diagnostics.shellcheck,
				-- Lua
				formatting.stylua,
				-- nls.builtins.diagnostics.luacheck,
				-- Python
				formatting.black.with({
					extra_args = { "--fast", "-l 88" },
				}),
				diagnostics.flake8.with({
					extra_args = { "--max-line-length=88" },
				}),
			},
			on_attach = function(client, buf)
				-- format on save
				if client.supports_method("textDocument/formatting") then
					-- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("LspFormat." .. buf, {}),
						-- group = augroup,
						buffer = buf,
						callback = function()
							lsp_formatting(buf)
						end,
					})
				end
			end,
		}
	end,
}

-- vim: ts=2 sts=2 sw=2 et
