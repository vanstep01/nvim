vim.g.mapleader = " "
-- this function complitely repeat contract of set
local map = require('langmapper').map
local builting = require('telescope.builtin')

-- Telescope
map('n', '<leader>ff', builting.find_files, {})
map('n', '<leader>fg', builting.live_grep, {})
map('n', '<leader>fb', builting.buffers, {})
map('n', '<leader>fh', builting.help_tags, {})

-- Code format
map("n", "<leader>lf", ":lua vim.lsp.buf.format()")

-- Navigation
map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-j>", ":wincmd j<CR>")
map("n", "<C-k>", ":wincmd k<CR>")
map("n", "<C-l>", ":wincmd l<CR>")

-- Native tabs
map("n", "[t", ":tabprevious<CR>")
map("n", "]t", ":tabnext<CR>")
map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<leader>tx", ":tabclose<CR>")

-- Window management
map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>s")
map('n', '<C-h>', '<C-w>h', { desc = 'Focus to left-side window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Focus to right-side window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Focus to top-side window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Focus to bottom-side window' })

map('n', '<C-S-h>', '<C-w><')
map('n', '<C-S-j>', '<C-w>-')
map('n', '<C-S-k>', '<C-w>+')
map('n', '<C-S-l>', '<C-w>>')

-- Oil
map("n", "<leader>e", require("oil").open_float)

-- Other
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>w", ":w<CR>")
map("n", "<ESC>", ":noh<CR>")
map("n", "<leader>ds", function() require('trouble').toggle() end)

-- Oil
map("n", "<leader>O", "<cmd>Oil<cr>")
