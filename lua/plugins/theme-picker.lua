return {
	"zaldih/themery.nvim",
	lazy = false,
	keys = {
		{ "<leader>th", ":Themery<CR>", desc = "Theme picker" },
	},
	config = function()
		require("themery").setup({
			themes = {
				"onedark_vivid",
				"nightfox",
				"everforest",
				"gruvbox",
				"catppuccin-frappe",
				"catppuccin-latte",
				"catppuccin-mocha",
				"catppuccin-macchiato",
			},
			livePreview = true,
		})
	end,
}
