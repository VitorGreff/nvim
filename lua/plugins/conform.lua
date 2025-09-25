return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "goimports", "gofumpt", "black", "stylua" },
			run_on_start = true,
			auto_update = false,
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				css = { "biome" },
				scss = { "biome" },
				html = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				markdown = { "prettierd" },
				["markdown.mdx"] = { "prettierd" },
				handlebars = { "prettierd" },

				lua = { "stylua" },
				go = { "goimports", "gofumpt" },
				gleam = { "gleam" },
				python = { "black" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = false,
			},
		},
	},
}
