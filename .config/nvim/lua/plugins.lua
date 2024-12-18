return require 'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'linrongbin16/lsp-progress.nvim',
    requires = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('lsp-progress').setup()
    end
  }

  use 'andweeb/presence.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  use 'windwp/nvim-autopairs'
	use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
	use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
	use 'romgrk/barbar.nvim'
	use { 'nvim-lualine/lualine.nvim',
	  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
  use 'rcarriga/nvim-notify'
  use { 'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    require("trouble").setup {}
  }

	use 'nyoom-engineering/oxocarbon.nvim'
	use 'terrortylor/nvim-comment'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }
	use {'akinsho/toggleterm.nvim', tag = '*', config = function()
  require('toggleterm').setup()
	end}
	
	use 'nvimtools/none-ls.nvim'

	use 'hrsh7th/nvim-cmp'
 	use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/vim-vsnip'


end)
