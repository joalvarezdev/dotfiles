-- Neovim API aliases

local cmd = vim.cmd
local exec = vim.api.nvim_exec
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- General

g.mapleader = " "

g.dbs_supported_types = {'mssql'}

g.dbs_mssql_options = {
         server = '10.0.0.91',
	 database = 'master',
	 user = 'Desarrollo.JAlvarez',
	 password = 'Jalvarez01'
 }

-- UI

opt.number = true
opt.relativenumber = true
