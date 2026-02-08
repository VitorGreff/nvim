return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { "onedark_vivid", "nightfox", "everforest", "gruvbox" },
			livePreview = true,
		})
	end,

	vim.keymap.set("n", "<leader>th", ":Themery<CR>", { desc = "Theme picker" }),
}
