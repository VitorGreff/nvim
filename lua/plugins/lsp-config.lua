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
					"jdtls",
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

					["gopls"] = function()
						vim.lsp.enable("gopls", {
							root_markers = { "go.mod", "go.work", ".git" },
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
								".git",
							},
							capabilities = capabilities,
						})
					end,

					["rust_analyzer"] = function()
						vim.lsp.enable("rust_analyzer", {
							root_markers = { "Cargo.toml", ".git" },
							capabilities = capabilities,
						})
					end,

					["tailwindcss"] = function()
						vim.lsp.enable("tailwindcss", {
							root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" },
							capabilities = capabilities,
						})
					end,

					["astro"] = function()
						vim.lsp.enable("astro", {
							root_markers = { "astro.config.mjs", "package.json", ".git" },
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

					["jdtls"] = function()
						vim.lsp.enable("jdtls", {
							root_markers = {
								-- Maven
								"pom.xml",
								-- Gradle
								"build.gradle",
								"build.gradle.kts",
								"settings.gradle",
								"settings.gradle.kts",
								-- Other Java project markers
								".classpath",
								".project",
								"src/main/java",
								-- Fallback
								".git",
							},
							capabilities = capabilities,
							settings = {
								java = {
									signatureHelp = { enabled = true },
									contentProvider = { preferred = "fernflower" },
									completion = {
										favoriteStaticMembers = {
											"org.junit.jupiter.api.Assertions.*",
											"org.junit.Assert.*",
											"org.mockito.Mockito.*",
										},
										filteredTypes = {
											"com.sun.*",
											"io.micrometer.shaded.*",
											"java.awt.*",
											"jdk.*",
											"sun.*",
										},
									},
									sources = {
										organizeImports = {
											starThreshold = 9999,
											staticStarThreshold = 9999,
										},
									},
									codeGeneration = {
										toString = {
											template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
										},
										hashCodeEquals = {
											useJava7Objects = true,
										},
										useBlocks = true,
									},
									configuration = {
										runtimes = {
											-- Example:
											-- {
											--   name = "JavaSE-17",
											--   path = "/usr/lib/jvm/java-17-openjdk",
											-- },
										},
									},
								},
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
			vim.lsp.enable("gleam", {
				root_markers = { ".git", "gleam.toml" },
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
