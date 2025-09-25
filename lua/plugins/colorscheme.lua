return {
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require("monokai-pro").setup({
				filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
			})
			vim.cmd.colorscheme("monokai-pro-spectrum")
		end,
	},
	{
		"gantoreno/nvim-gabriel",
		config = function()
			-- vim.cmd.colorscheme("gabriel")
		end,
	},
	{
		"aktersnurra/no-clown-fiesta.nvim",
		config = function()
			--vim.cmd.colorscheme("no-clown-fiesta")
		end,
	},
	{
		"savq/melange-nvim",
		-- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
		config = function()
			--vim.cmd("colorscheme melange")
		end,
	},
}
