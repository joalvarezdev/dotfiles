-- Neovim API aliases

local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- General

g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- UI

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true


opt.number = true
opt.relativenumber = true
