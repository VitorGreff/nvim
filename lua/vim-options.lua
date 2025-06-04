vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", function()
  local prettier_filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "css",
    "less",
    "scss",
    "json",
    "graphql",
    "markdown",
    "vue",
    "yaml",
    "html",
  }

  local function is_prettier_filetype(ft)
    for _, v in ipairs(prettier_filetypes) do
      if v == ft then
        return true
      end
    end
    return false
  end

  if is_prettier_filetype(vim.bo.filetype) then
    -- Use Prettier for supported file types
    require("conform").format({ bufnr = 0, lsp_fallback = true })
  elseif vim.bo.filetype == "go" then
    vim.lsp.buf.format()
    -- Golang autoimport
    vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
    vim.lsp.buf.format()
  else
    vim.lsp.buf.format()
  end
  vim.cmd("w!")
end, { desc = "Force write, format, and organize imports (Go-specific)" })

vim.keymap.set("n", "<leader>q", ":q!<CR>", { desc = "Force quit" })
vim.keymap.set("n", "<leader>p", ":Prettier<CR>:w!<CR>", { desc = "Prettier" })

-- supermaven
vim.api.nvim_set_keymap("n", "<leader>st", ":SupermavenStart<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sp", ":SupermavenStop<CR>", { noremap = true, silent = true })

vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-- error diagnosis
vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
end, { noremap = true, silent = true, desc = "Open diagnostic float" })

-- disable error messages
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   underline = true,
--   virtual_text = false,
-- })
