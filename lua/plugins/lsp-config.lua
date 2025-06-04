return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Function on_attach global: executed when a LSP server is attached to a buffer.
      -- Ideal for setting keymaps specific to the LSP and other configurations per buffer.
      local function on_attach(client, bufnr)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "LSP: Hover" })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "LSP: Go to definition" })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
          { buffer = bufnr, desc = "LSP: Code Actions" })
      end

      return {
        ensure_installed = {
          "ts_ls",
          "emmet_ls",
          "jsonls",
          "cssls",
          "rust_analyzer",
          "lua_ls",
          "html",
          "gopls",
          "pyright",
          "clangd",
          "zls",
          "marksman",
          "tailwindcss",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end,

          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                Lua = {
                  runtime = { version = "LuaJIT" },
                  diagnostics = { globals = { "vim" } },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                  },
                  telemetry = { enable = false },
                },
              },
            })
          end,

          ["gopls"] = function()
            require("lspconfig").gopls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                gopls = {
                  analyses = {
                    unusedparams = true,
                  },
                  staticcheck = true,
                  gofumpt = true,
                },
              },
            })
          end,

          ["emmet_ls"] = function()
            local emmet_capabilities = vim.lsp.protocol.make_client_capabilities()
            emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true

            require("lspconfig").emmet_ls.setup({
              capabilities = vim.tbl_deep_extend("force", {}, capabilities, emmet_capabilities),
              on_attach = on_attach,
              filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
              init_options = {
                html = {
                  options = {
                    ["bem.enabled"] = true,
                  },
                },
              },
            })
          end,

          ["html"] = function()
            require("lspconfig").html.setup({
              capabilities = capabilities,
              on_attach = on_attach,
              filetypes = { "html", "angular.html" }, -- Add other filetypes if necessary
            })
          end,

        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    -- The 'config' function here now only needs to deal with LSPs that ARE NOT
    -- managed by mason and mason-lspconfig, or global lspconfig settings (rare).
    config = function()
      require('lspconfig').gleam.setup({})
      -- Most of the keymaps have already been moved to the global 'on_attach' function.
      -- The 'setup_lsp' function previously was not needed here for servers managed
      -- by mason-lspconfig.
    end,
  },
}
