-- 基础设置
require('basic')
-- Packer 插件管理
require('plugins')
-- 快捷键映射
require('keybindings')
-- 外观设置
require('colorscheme-config.tokoynight')
require('colorscheme')

-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.nvim-treesitter')
require('plugin-config.telescope')
require('plugin-config.blankline')
require('plugin-config.comment')
require('plugin-config.nvim-surround')
require('plugin-config.gitsigns')
require('plugin-config.diffview')
require('plugin-config.hlslens')
require('plugin-config.project')
require('plugin-config.dashboard')
require('plugin-config.oscyank')

-- 内置 lsp
require('lsp.setup')
require('lsp.nvim-cmp')
require('lsp.ui')
