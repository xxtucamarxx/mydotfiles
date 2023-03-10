local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Go to vimrc
keymap("n", "<leader>c", ":e $MYVIMRC<CR>", term_opts)
-- Runs current buffers
keymap("n", "<F9>", "<Esc>:w<enter>:! chmod +x %<enter>:! %<enter>", term_opts)
keymap("i", "<F9>", "<Esc>:w<enter>:! chmod +x %<enter>:! %<enter>", term_opts)

keymap("n", "<C-q>", "<CMD>q!<CR>", opts)
keymap("n", "<C-s>", "<CMD>w<CR>", opts)

keymap("n", "<leader>o", "o<Esc>k", opts)
keymap("n", "<leader>O", "O<Esc>j", opts)
-- Normal --
keymap("n", "<C-g>", ":lua _HTOP_TOGGLE()<CR>", opts)
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

-- Navigate buffers
keymap("n", "L", ":bnext<CR>", opts)
keymap("n", "H", ":bprevious<CR>", opts)
keymap("n", "<leader>d", ":bdelete!<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("i", "ii", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Select all
keymap("n", "<leader><C-a>", "ggVG", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope git_branches<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)



vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
  end,
})
