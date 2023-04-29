local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or					       , branch = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	use('theprimeagen/harpoon')

	use('mbbill/undotree')

	use {
  		'VonHeikemen/lsp-zero.nvim',
  		branch = 'v2.x',
  		requires = {
    			-- LSP Support
    			{'neovim/nvim-lspconfig'},             -- Required
    			{                                      -- Optional
      				'williamboman/mason.nvim',
      				run = function()
        				pcall(vim.cmd, 'MasonUpdate')
      				end,
    			},
    			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
    			{'hrsh7th/nvim-cmp'},     -- Required
    			{'hrsh7th/cmp-nvim-lsp'}, -- Required
    			{'L3MON4D3/LuaSnip'},     -- Required
  		}
	}


	use 'Shatur/neovim-ayu'
	use 'kristijanhusak/vim-dadbod-ui'
	use 'tpope/vim-dadbod'
	use 'tpope/vim-dotenv'
end)