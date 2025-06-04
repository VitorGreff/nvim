-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   config = function()
--     require("catppuccin").setup({
--       transparent_background = false,
--     })
--     vim.cmd.colorscheme("catppuccin-mocha")
--   end,
-- }

-- return {
--   "ellisonleao/gruvbox.nvim",
--   config = function()
--     -- Default options:
--     require("gruvbox").setup({
--       terminal_colors = true, -- add neovim terminal colors
--       undercurl = true,
--       underline = true,
--       bold = false,
--       italic = {
--         strings = true,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true,
--       },
--       strikethrough = true,
--       invert_selection = false,
--       invert_signs = false,
--       invert_tabline = false,
--       invert_intend_guides = false,
--       inverse = true, -- invert background for search, diffs, statuslines and errors
--       contrast = "",  -- can be "hard", "soft" or empty string
--       palette_overrides = {},
--       overrides = {},
--       dim_inactive = false,
--       transparent_mode = true,
--     })
--     vim.cmd("colorscheme gruvbox")
--   end,
-- }


-- return {
-- 	"savq/melange-nvim",
-- 	config = function()
-- 		vim.opt.termguicolors = true
-- 		vim.cmd.colorscheme("melange")
-- 	end,
-- }

return {
  "rebelot/kanagawa.nvim",
  config = function()
    -- Default options:
    require("kanagawa").setup({
      compile = false,  -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,   -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {             -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "wave",  -- Load "wave" theme when 'background' option is not set
      background = {   -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    })

    -- setup must be called before loading
    vim.cmd("colorscheme kanagawa")
  end,
}

-- return {
-- 	{
-- 		"datsfilipe/vesper.nvim",
-- 		config = function()
-- 			require("vesper").setup({
-- 				transparent = true, -- Boolean: Sets the background to transparent
-- 				italics = {
-- 					comments = true, -- Boolean: Italicizes comments
-- 					keywords = true, -- Boolean: Italicizes keywords
-- 					functions = true, -- Boolean: Italicizes functions
-- 					strings = true, -- Boolean: Italicizes strings
-- 					variables = true, -- Boolean: Italicizes variables
-- 				},
-- 				overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
-- 				palette_overrides = {},
-- 			})
-- 			vim.cmd.colorscheme("vesper")
-- 		end,
-- 	},
-- }

-- return {
-- 	"sainnhe/sonokai",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.sonokai_enable_italic = true
-- 		vim.cmd.colorscheme("sonokai")
-- 	end,
-- }
