vim.wo.number = true
vim.wo.relativenumber = true

vim.wo.signcolumn = "yes"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.termguicolors = true

vim.cmd([[highlight clear SignColumn]])
