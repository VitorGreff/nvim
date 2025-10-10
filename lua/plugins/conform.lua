return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"goimports",
				"gofumpt",
				"black",
				"stylua",
				"prettierd",
				"biome",
				"rustfmt",
				"google-java-format",
			},
			run_on_start = true,
			auto_update = false,
		},
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters = {
				biome = {
					args = {
						"check",
						"--write",
						"--unsafe",
						"--stdin-file-path",
						"$FILENAME",
					},
				},
			},
			formatters_by_ft = {
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				css = { "biome" },
				scss = { "biome" },
				html = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				markdown = { "prettier" },
				["markdown.mdx"] = { "prettier" },
				handlebars = { "prettier" },
				astro = { "prettier" },
				lua = { "stylua" },
				go = { "goimports", "gofumpt" },
				gleam = { "gleam" },
				python = { "black" },
				rust = { "rustfmt" },
				java = { "google-java-format" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = false,
			},
		},
	},
}
