return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"html",
					"cssls",
					"tailwindcss",
					"emmet_ls",
					"jsonls",
					"marksman",
					"gopls",
					"pyright",
					"rust_analyzer",
					"astro",
					"biome",
				},
				-- LSPs handled by mason
				handlers = {
					function(server_name)
						vim.lsp.config(server_name, {
							capabilities = capabilities,
						})
						vim.lsp.enable(server_name)
					end,

					["lua_ls"] = function()
						vim.lsp.config("lua_ls", {
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = { globals = { "vim" } },
								},
							},
						})
						vim.lsp.enable("lua_ls")
					end,

					["ts_ls"] = function()
						vim.lsp.config("ts_ls", {
							root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
							capabilities = capabilities,
						})
						vim.lsp.enable("ts_ls")
					end,

					["biome"] = function()
						vim.lsp.config("biome", {
							root_markers = { "biome.json", "biome.jsonc" },
							capabilities = capabilities,
						})
						vim.lsp.enable("biome")
					end,

					["gopls"] = function()
						vim.lsp.config("gopls", {
							root_markers = { "go.mod", "go.work" },
							capabilities = capabilities,
						})
						vim.lsp.enable("gopls")
					end,

					["pyright"] = function()
						vim.lsp.config("pyright", {
							root_markers = {
								"pyproject.toml",
								"setup.py",
								"requirements.txt",
								"pyrightconfig.json",
							},
							capabilities = capabilities,
						})
						vim.lsp.enable("pyright")
					end,

					["rust_analyzer"] = function()
						vim.lsp.config("rust_analyzer", {
							root_markers = { "Cargo.toml" },
							capabilities = capabilities,
						})
						vim.lsp.enable("rust_analyzer")
					end,

					["tailwindcss"] = function()
						vim.lsp.config("tailwindcss", {
							root_markers = {
								"tailwind.config.js",
								"tailwind.config.ts",
								"tailwind.config.cjs",
								"tailwind.config.mjs",
							},
							capabilities = capabilities,
						})
						vim.lsp.enable("tailwindcss")
					end,

					["astro"] = function()
						vim.lsp.config("astro", {
							root_markers = {
								"astro.config.mjs",
								"astro.config.js",
								"astro.config.ts",
							},
							capabilities = capabilities,
						})
						vim.lsp.enable("astro")
					end,

					["emmet_ls"] = function()
						local emmet_capabilities = vim.deepcopy(capabilities)
						emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true
						vim.lsp.config("emmet_ls", {
							capabilities = emmet_capabilities,
							filetypes = {
								"typescriptreact",
								"javascriptreact",
								"tsx",
								"jsx",
								"astro",
							},
						})
						vim.lsp.enable("emmet_ls")
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- LSPs not handled by mason
			vim.lsp.config("gleam", {
				root_markers = { "gleam.toml" },
				capabilities = capabilities,
			})
			vim.lsp.enable("gleam")
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover({
					border = "rounded",
					max_height = 80,
					max_width = 80,
					wrap = true,
				})
			end, { desc = "LSP: Hover" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
			vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = "LSP: Code actions" })
		end,
	},
}
