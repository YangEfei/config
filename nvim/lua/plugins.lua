-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  vim.notify('没有安装 packer.nvim')
  return
end

packer.startup({
  function(use)
    -- Use a protected call so we don't error out on first use
    use('wbthomason/packer.nvim')
    -- themes
    use({ 'ellisonleao/gruvbox.nvim', requires = 'rktjmp/lush.nvim' })
    use('glepnir/zephyr-nvim')
    -- nvim-tree
    use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
    -- bufferline
    use({ 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons' })
    -- lualine
    use({ 'nvim-lualine/lualine.nvim', requires = 'kyazdani42/nvim-web-devicons' })
    use('arkav/lualine-lsp-progress')
    -- nvim-treesitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    -- indent-blankline
    use('lukas-reineke/indent-blankline.nvim')
    -- telescope
    use({ 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = 'nvim-lua/plenary.nvim' })
    -- telescope extensions
    use('LinArcX/telescope-env.nvim')
    use('nvim-telescope/telescope-ui-select.nvim')
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })
    use ("nvim-telescope/telescope-file-browser.nvim")
    use ('alex-laycalvert/telescope-dotfiles.nvim')
    -- nvim-hlslens
    use ('kevinhwang91/nvim-hlslens')
    -- illuminate
    use ('RRethy/vim-illuminate')
    -- git
    use('lewis6991/gitsigns.nvim')
    -- use('tpope/vim-fugitive')
    -- Comment
    use('numToStr/Comment.nvim')
    -- surround
    use('kylechui/nvim-surround')
    -- project
    use('ahmedkhalf/project.nvim')
    -- dashboard
    use('glepnir/dashboard-nvim')
    ----------------- lsp -----------------
    -- nvim-lspconfig
    use({ 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer' })
    -- 补全源
    use('hrsh7th/cmp-nvim-lsp') -- { name = 'nvim_lsp' }
    use('hrsh7th/cmp-buffer')   -- { name = 'buffer' }
    use('hrsh7th/cmp-path')     -- { name = 'path' }
    use('hrsh7th/cmp-cmdline')  -- { name = 'cmdline' }
    -- 补全引擎
    use('hrsh7th/nvim-cmp')
    -- snippet 引擎
    use('hrsh7th/cmp-vsnip')    -- { name = 'vsnip' }
    use('hrsh7th/vim-vsnip')
    use('rafamadriz/friendly-snippets')
    -- lspkind-nvim
    use('onsails/lspkind-nvim')
    -- lspsaga
    use('glepnir/lspsaga.nvim')
    -- Lua 增强
    use('folke/neodev.nvim')
    -- clangd 增强
    use('p00f/clangd_extensions.nvim')
  end
})
