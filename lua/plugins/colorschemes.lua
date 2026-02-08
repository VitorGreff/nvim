return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			require("onedarkpro").setup({
				options = {
					transparency = true,
				},
			})
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
		end,
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({})
		end,
	},
}
