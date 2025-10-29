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
						vim.lsp.enable(server_name, {
							capabilities = capabilities,
						})
					end,

					["lua_ls"] = function()
						vim.lsp.enable("lua_ls", {
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = { globals = { "vim" } },
								},
							},
						})
					end,

					["ts_ls"] = function()
						vim.lsp.enable("ts_ls", {
							root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
							capabilities = capabilities,
						})
					end,

					["biome"] = function()
						vim.lsp.enable("biome", {
							root_markers = { "biome.json", "biome.jsonc" },
							capabilities = capabilities,
						})
					end,

					["gopls"] = function()
						vim.lsp.enable("gopls", {
							root_markers = { "go.mod", "go.work" },
							capabilities = capabilities,
						})
					end,

					["pyright"] = function()
						vim.lsp.enable("pyright", {
							root_markers = {
								"pyproject.toml",
								"setup.py",
								"requirements.txt",
								"pyrightconfig.json",
							},
							capabilities = capabilities,
						})
					end,

					["rust_analyzer"] = function()
						vim.lsp.enable("rust_analyzer", {
							root_markers = { "Cargo.toml" },
							capabilities = capabilities,
						})
					end,

					["tailwindcss"] = function()
						vim.lsp.enable("tailwindcss", {
							root_markers = {
								"tailwind.config.js",
								"tailwind.config.ts",
								"tailwind.config.cjs",
								"tailwind.config.mjs",
							},
							capabilities = capabilities,
						})
					end,

					["astro"] = function()
						vim.lsp.enable("astro", {
							root_markers = {
								"astro.config.mjs",
								"astro.config.js",
								"astro.config.ts",
							},
							capabilities = capabilities,
						})
					end,

					["emmet_ls"] = function()
						local emmet_capabilities = vim.deepcopy(capabilities)
						emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true
						vim.lsp.enable("emmet_ls", {
							capabilities = emmet_capabilities,
							filetypes = {
								"typescriptreact",
								"javascriptreact",
								"tsx",
								"jsx",
								"astro",
							},
						})
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
			-- LSPs not handlet by mason
			vim.lsp.enable("gleam", {
				root_markers = { "gleam.toml" },
				capabilities = capabilities,
			})
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
