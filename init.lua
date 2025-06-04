local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.swapfile = false

vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"

-- blink cursor
-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
--     .. ",a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
--     .. ",sm:block-blinkwait175-blinkoff150-blinkon175"

require("vim-options")
require("lazy").setup("plugins")
