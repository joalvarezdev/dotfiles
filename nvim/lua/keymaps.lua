-- Aliases

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd

map('i', 'jk', '<ESC>', {noremap = true})

map('', '<leader>so', ':source ~/.config/nvim/init.lua<CR>', {noremap = true})

map('', '<leader>w', ':w<CR>', {noremap = true})
map('', '<leader>q', ':q<CR>', {noremap = true})
map('', '<leader>e', ':q!<CR>', {noremap = true})

map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})

map('i', '<C-h>', '<left>', default_opts)
map('i', '<C-l>', '<right>', default_opts)
map('i', '<C-k>', '<up>', default_opts)
map('i', '<C-j>', '<down>', default_opts)

-- REST
map("n", "<leader>rr", ":lua require('rest-nvim').run()<CR>", { noremap = true })
