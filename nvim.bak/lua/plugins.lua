local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- the colorscheme should be available when starting Neovim
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      require('plugins.nvim-tree')
    end
  },
  -- bufferline
  {
    'akinsho/bufferline.nvim',
    version = "^3.0.0",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins.bufferline')
    end
  },
  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
      require('plugins.lualine')
    end
  },
  {
    'arkav/lualine-lsp-progress'
  },
  -- nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('plugins.nvim-treesitter')
    end
  },
  -- indent-blankline
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.blankline')
    end
  },
  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('plugins.telescope')
    end

  },
  {
    'LinArcX/telescope-env.nvim'
  },
  {
    'nvim-telescope/telescope-ui-select.nvim'
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    'alex-laycalvert/telescope-dotfiles.nvim'
  },
  -- hlslens
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('plugins.hlslens')
    end
  },
  -- git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.gitsigns')
    end
  },
  {
    'rhysd/git-messenger.vim'
  },
  {
    'sindrets/diffview.nvim',
    dependenices = 'nvim-lua/plenary.nvim'
  },
  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function()
      require('plugins.comment')
    end
  },
  -- surround
  {
    'kylechui/nvim-surround'
  },
  -- project
  {
    'ahmedkhalf/project.nvim'
  },
  -- dashboard
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    opts = function()
      require('plugins.dashboard')
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  -- oscyank
  {
    'ojroques/nvim-osc52'
  },
  ----------------- lsp -----------------
  -- nvim-lspconfig
  {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer'
  },
  -- 补全源
  {
    'hrsh7th/cmp-nvim-lsp', -- { name = 'nvim_lsp' }
    'hrsh7th/cmp-buffer', -- { name = 'buffer' }
    'hrsh7th/cmp-path', -- { name = 'path' }
    'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
  },
  -- 补全引擎
  {
    'hrsh7th/nvim-cmp',
    -- load cmp on InsertEnter
    event = 'InsertEnter',
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- { name = 'nvim_lsp' }
      'hrsh7th/cmp-buffer', -- { name = 'buffer' }
      'hrsh7th/cmp-path', -- { name = 'path' }
      'hrsh7th/cmp-cmdline' -- { name = 'cmdline' } 
    },
  },
  -- snippet 引擎
  {
    'hrsh7th/cmp-vsnip', -- { name = 'vsnip' }
    'hrsh7th/vim-vsnip',
    'rafamadriz/friendly-snippets'
  },
  -- lspkind-nvim
  {
    'onsails/lspkind-nvim'
  },
  -- lspsaga
  {
    'glepnir/lspsaga.nvim'
  },
  -- Lua 增强
  {
    'folke/neodev.nvim'
  },
})
