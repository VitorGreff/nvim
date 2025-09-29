return {
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
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
			vim.cmd.color("vague")
		end,
	},
}
