return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'dark' -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      }
      -- require('onedark').load()
    end
  },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
      })
      vim.cmd.colorscheme("monokai-pro-spectrum")
    end
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.g.sonokai_enable_italic = true
      -- vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "savq/melange-nvim",
    config = function()
      vim.opt.termguicolors = true
    end,
  },
}
