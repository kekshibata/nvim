local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
--Delete without yank
keymap("n", "<leader>d", '"_d', opts)
keymap("n", "<leader>x", '"_x', opts)
--Increment/Decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)
--Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)
--Tabs
keymap("n", "te", ":tabedit", opts)
keymap("n", "<S-Tab>", "<cmd>tabprev<CR>", opts)
keymap("n", "<Tab>", "<cmd>tabnext<CR>", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Custom
keymap("n", ";f", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", ";r", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", ";b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", ";;", "<cmd>Telescope help_tags<cr>", opts)
keymap("n", "<leader>e", "<cmd>:NvimTreeToggle<cr>", opts)
keymap("n", "<leader>f", "<cmd>:lua vim.lsp.buf.formatting()<cr>", opts)

-- Insert --
keymap("i", "<C-l>", "<C-t>", opts)
