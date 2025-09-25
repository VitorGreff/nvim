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
					"biome",
					"html",
					"cssls",
					"tailwindcss",
					"emmet_ls",
					"jsonls",
					"marksman",
					"gopls",
					"pyright",
					"rust_analyzer",
				},
				-- LSPs handled by mason
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = { globals = { "vim" } },
								},
							},
						})
					end,

					["emmet_ls"] = function()
						local emmet_capabilities = vim.deepcopy(capabilities)
						emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true
						require("lspconfig").emmet_ls.setup({
							capabilities = emmet_capabilities,
							filetypes = {
								"typescriptreact",
								"javascriptreact",
								"tsx",
								"jsx",
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
			-- LSPs handled by nvim-lspconfig
			require("lspconfig").gleam.setup({
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
