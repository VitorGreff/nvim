return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "emmet_ls",
        "cssls",
        "html",
        "tailwindcss",
        "jsonls",
        "marksman",
        "rust_analyzer",
        "gopls",
        "clangd",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = require("mason-lspconfig").get_installed_servers()

      for _, server_name in ipairs(servers) do
        local config = {
          capabilities = capabilities,
        }
        if server_name == "lua_ls" then
          config.settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          }
        elseif server_name == "gopls" then
          config.settings = {
            gopls = {
              analyses = { unusedparams = true },
              staticcheck = true,
              gofumpt = true,
            },
          }
        elseif server_name == "emmet_ls" then
          local emmet_capabilities = vim.lsp.protocol.make_client_capabilities()
          emmet_capabilities.textDocument.completion.completionItem.snippetSupport = true
          config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, emmet_capabilities)
          config.filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" }
        else
          -- base configuration load
          lspconfig[server_name].setup(config)
        end
      end

      -- non mason LSPs wll be loaded here
      lspconfig.gleam.setup({
        capabilities = capabilities,
      })

      -- global bindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: go to definition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
        { desc = "LSP: code actions" })
    end,
  },
}
