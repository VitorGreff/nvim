return {
	"zaldih/themery.nvim",
	lazy = false,
	keys = {
		{ "<leader>th", ":Themery<CR>", desc = "Theme picker" },
	},
	config = function()
		require("themery").setup({
			themes = { "onedark_vivid", "nightfox", "everforest", "gruvbox" },
			livePreview = true,
		})
	end,
}
