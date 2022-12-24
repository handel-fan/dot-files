
local Plug = vim.fn['plug#']
vim.call('plug#begin')

  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'nickeb96/fish.vim'
  Plug 'winston0410/commented.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'prettier/vim-prettier'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'puremourning/vimspector'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug ('akinsho/toggleterm.nvim', { tag = '*' })
  --color themes
  Plug 'EdenEast/nightfox.nvim'
  Plug 'yashguptaz/calvera-dark.nvim'
  Plug ('folke/tokyonight.nvim', { branch = 'main' })

  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'kartikp10/noctis.nvim'
  Plug 'rktjmp/lush.nvim'

  Plug ('nvim-telescope/telescope.nvim')
  Plug ('nvim-treesitter/nvim-treesitter')

  Plug 'folke/trouble.nvim'

vim.call('plug#end')
