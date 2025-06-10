vim.g.mapleader = " "
vim.cmd("set number")
vim.cmd("set mouse=a")
vim.cmd("syntax enable")
vim.cmd("set showcmd")
vim.cmd("set encoding=utf-8")
vim.cmd("set showmatch")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=0")
vim.cmd("set softtabstop=0")
vim.cmd("set autoindent")
vim.cmd("set smarttab")
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- generic commands
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { noremap = true, silent = true, desc = "Quit"})
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { noremap = true, silent = true, desc = "Write"})

-- window management
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { noremap = true, silent = true, desc = "Split Vertical"})
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- keep n and N middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--move lines up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- use system register
vim.opt.clipboard = 'unnamedplus'

-- remove highlight from words on ENTER when searching
vim.keymap.set("n", '<C-e>', '<cmd>noh<CR>', { noremap = true, silent = true })

-- copilot blink hiding
vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    vim.b.copilot_suggestion_hidden = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})
