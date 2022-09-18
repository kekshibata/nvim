local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
keymap("n", ",q", "<cmd>bd<CR>", opts)
keymap("n", ",w", "<cmd>w<CR>", opts)
keymap("n", "<Esc><Esc>", "<cmd>noh<CR>", opts)
--Delete without yank
keymap("n", "<leader>d", '"_d', opts)
keymap("n", "x", '"_x', opts)
--Increment/Decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)
--Select all
keymap("n", "<C-a>", "gg<S-v>G", opts)
--Switch buffers
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
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
keymap("n", "<leader>e", "<cmd>:NvimTreeToggle<cr>", opts)
keymap("n", "<leader>w", "<cmd>HopWord<CR>", opts)
keymap("n", "<leader>s", "<cmd>HopChar1<CR>", opts)
keymap("n", "<leader>/", "<cmd>HopPattern<CR>", opts)

-- Insert --
keymap("i", "<C-l>", "<C-t>", opts)
