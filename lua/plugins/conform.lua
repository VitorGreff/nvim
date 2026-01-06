---@diagnostic disable: unused-local
return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"goimports",
				"gofumpt",
				"stylua",
				"prettierd",
				"biome",
				"rustfmt",
				"sql-formatter",
				"ruff",
			},
			run_on_start = true,
			auto_update = false,
		},
	},
	{
		"stevearc/conform.nvim",
		opts = function()
			-- checks for config files in the current directory
			-- if none are found, falls back to prettierd (no global config needed)
			local function select_formatter(bufnr)
				local cwd = vim.fn.getcwd()
				if vim.fn.filereadable(cwd .. "/biome.json") == 1 then
					return { "biome" }
				else
					return { "prettierd" }
				end
			end

			return {
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
					["sql-formatter"] = {
						command = "sql-formatter",
						args = { "-l", "sql" },
						stdin = true,
					},
					ruff_format = {
						command = "ruff",
						args = {
							"format",
							"--stdin-filename",
							"$FILENAME",
							"-",
						},
						stdin = true,
					},
				},
				formatters_by_ft = {
					javascript = select_formatter,
					typescript = select_formatter,
					javascriptreact = select_formatter,
					typescriptreact = select_formatter,
					html = select_formatter,
					css = select_formatter,
					scss = { "prettierd" },
					json = { "prettierd" },
					jsonc = { "prettierd" },
					markdown = { "prettierd" },
					["markdown.mdx"] = { "prettierd" },
					astro = select_formatter,
					lua = { "stylua" },
					go = { "goimports", "gofumpt" },
					gleam = { "gleam" },
					python = { "ruff_format" },
					rust = { "rustfmt" },
					sql = { "sql-formatter" },
				},
				format_on_save = {
					timeout_ms = 2000,
					lsp_fallback = false,
				},
			}
		end,
	},
}
