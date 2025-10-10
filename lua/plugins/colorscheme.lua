return {
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
			})
			--vim.cmd.colorscheme("monokai-pro-spectrum")
		end,
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true,
			})
			--vim.cmd.color("vague")
		end,
	},
	{
		"kvrohit/rasmus.nvim",
		priority = 1000,
		config = function()
			--vim.cmd([[colorscheme rasmus]])
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
				},
			})
			vim.cmd.colorscheme("nightfox")
		end,
	},
}
