-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- Theming
	"folke/tokyonight.nvim",
	"joshdick/onedark.vim",
	"lunarvim/darkplus.nvim",
	"catppuccin/nvim",

	"nvim-lualine/lualine.nvim",
	{
		-- File explorer
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	"lukas-reineke/indent-blankline.nvim",
	{
		-- Fuzzy finder
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},

	"folke/which-key.nvim",
	-- Git
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },

	-- project management
	"ahmedkhalf/project.nvim",

	-- Code manipulation
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	-- "gc" to comment visual regions/lines
	"numToStr/Comment.nvim",
	"tpope/vim-surround",
	"wellle/targets.vim",
	"tpope/vim-repeat",
	"tpope/vim-rhubarb",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	{ "windwp/nvim-autopairs", config = true },

	-- Utilities
	"moll/vim-bbye",
	"nvim-lua/plenary.nvim",

	{
		"akinsho/toggleterm.nvim",
		opts = {
			open_mapping = "<C-g>",
			direction = "horizontal",
			shade_terminals = true,
		},
	},

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			"williamboman/mason-lspconfig.nvim",
			{ "j-hui/fidget.nvim",      config = true },
			{ "folke/neodev.nvim",      config = true },
		},
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},

	{
		-- Autocomplete
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip",
			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets", -- a bunch of snippets to use
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			-- Installs the debug adapters for you
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			-- Add your own debuggers here
			"leoluz/nvim-dap-go",
		},
	},
}
