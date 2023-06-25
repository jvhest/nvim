-- Unless you are still migrating, remove the deprecated commands from v1.x
-- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v2.x",
	keys = {
		{ "<C-n>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	opts = {
		filesystem = {
			follow_current_file = true,
			hijack_netrw_behavior = "open_default",
		},
	},
}
