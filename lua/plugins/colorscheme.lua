-- the colorscheme should be available when starting Neovim

return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		flavour = "macchiato", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "frappe",
			dark = "macchiato",
		},
	},
	-- config = function()
	-- 	vim.cmd([[ colorscheme catppuccin-macchiato ]])
	-- end,
}
