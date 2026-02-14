vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>w", ":w!<CR>", { desc = "Force write" })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { desc = "Force quit" })

-- Window navigation with wrapping in all directions
local function wrap_window(direction, opposite)
	local current_win = vim.api.nvim_get_current_win()
	vim.cmd("wincmd " .. direction)
	local new_win = vim.api.nvim_get_current_win()
	if current_win == new_win then
		-- Hit edge, wrap to opposite side
		vim.cmd("wincmd " .. opposite)
	end
end

vim.keymap.set("n", "<C-w>l", function()
	wrap_window("l", "h")
end, { noremap = true, desc = "Move right or wrap to left" })
vim.keymap.set("n", "<C-w>h", function()
	wrap_window("h", "l")
end, { noremap = true, desc = "Move left or wrap to right" })
vim.keymap.set("n", "<C-w>j", function()
	wrap_window("j", "k")
end, { noremap = true, desc = "Move down or wrap to top" })
vim.keymap.set("n", "<C-w>k", function()
	wrap_window("k", "j")
end, { noremap = true, desc = "Move up or wrap to bottom" })

vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

-- Set the working directory to the path of the current buffer
vim.keymap.set("n", "<leader>grb", function()
	vim.cmd("cd " .. vim.fn.expand("%:p:h"))
end, { desc = "Set working directory to path of buffer" })

-- Navigate up one directory
vim.keymap.set("n", "<leader>grd", function()
	vim.cmd("cd ..")
end, { desc = "Navigate up one directory from current" })

vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = {
		text = {
			-- [vim.diagnostic.severity.ERROR] = "●",
			-- [vim.diagnostic.severity.WARN] = "●",
			-- [vim.diagnostic.severity.INFO] = "●",
			-- [vim.diagnostic.severity.HINT] = "●",
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "⚠",
			[vim.diagnostic.severity.INFO] = "ℹ",
			[vim.diagnostic.severity.HINT] = "→",
		},
	},
})
