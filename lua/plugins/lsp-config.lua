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
          "emmet_ls",
          "cssls",
          "html",
          "jsonls",
          "marksman",
          "gopls",
          "clangd",
          "pyright",
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

          ["gopls"] = function()
            require("lspconfig").gopls.setup({
              capabilities = capabilities,
              settings = {
                gopls = {
                  analyses = { unusedparams = true },
                  staticcheck = true,
                  gofumpt = true,
                },
              },
            })
          end,

          ["emmet_ls"] = function()
            local emmet_capabilities = vim.deepcopy(capabilities)
            emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true

            require("lspconfig").emmet_ls.setup({
              capabilities = emmet_capabilities,
              filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
            })
          end,

          ["pyright"] = function()
            require("lspconfig").pyright.setup({
              capabilities = capabilities,
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
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code actions" })
    end,
  },
}
