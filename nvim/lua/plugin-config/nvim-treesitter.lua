local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("没有找到 nvim-treesitter")
  return
end

treesitter.setup({
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "cpp", "lua", "vim" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      scope_incremental = '<TAB>',
      node_decremental = '<BS>',
    }
  },
  -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
  indent = {
    enable = true
  }
})

-- 开启 Folding
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
  end
})
---ENDWORKAROUND
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
