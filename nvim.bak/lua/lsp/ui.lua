local status, lspsaga = pcall(require, "lspsaga")
if not status then
  vim.notify("没有找到 lspsaga")
  return
end

lspsaga.setup({
  finder = {
    edit = { 'o', '<CR>' },
    vsplit = 'v',
    split = 's',
    tabe = 't',
    quit = { 'q', '<ESC>' },
  },
  definition = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>s',
    tabe = '<C-c>t',
    quit = 'q',
    close = '<Esc>',
  },
  diagnostic = {
    twice_into = true,
    show_code_action = true,
    show_source = true,
    keys = {
      exec_action = '<CR>',
      quit = 'q',
      go_action = 'g'
    },
  },
  symbol_in_winbar = {
    enable = true,
    separator = ' ',
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = true,
    color_mode = true,
  },
})
--[[ lspsaga.init_lsp_saga({
  -- Options with default value
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "single",
  --the range of 0 for fully opaque window (disabled) to 100 for fully
  --transparent background. Values between 0-30 are typically most useful.
  saga_winblend = 0,
  -- when cusor in saga float window
  -- config these keys to move
  move_in_saga = {
    prev = '<C-p>',
    next = '<C-n>',
  },
  -- diagnostic sign
  -- Error, Warn, Info, Hint
  -- diagnostic_header = { "😡", "😥", "😤", "😐" },
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  -- preview lines above of lsp_finder
  preview_lines_above = 0,
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 10,
  -- code action title icon
  code_action_icon = "ﯦ ",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = true,
    enable_in_insert = true,
    cache_code_action = true,
    sign = true,
    update_time = 150,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_icons = {
    -- def = '  ',
    -- ref = '  ',
    -- link = '  ',
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  -- finder do lsp request timeout
  -- if your project is big enough or your server very slow
  -- you may need to increase this value
  finder_request_timeout = 1500,
  finder_action_keys = {
    -- open = "o",
    open = "<CR>",
    vsplit = "s",
    split = "i",
    tabe = "t",
    -- quit = "q",
    quit = "<ESC>",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>",
  },
  code_action_keys = {
    -- quit = "q",
    quit = "<ESC>",
    exec = "<CR>",
  },
  definition_action_keys = {
    edit = '<C-c>o',
    vsplit = '<C-c>v',
    split = '<C-c>i',
    tabe = '<C-c>t',
    quit = 'q',
  },
  rename_action_quit = "<ESC>",
  rename_in_select = true,
  -- show symbols in winbar must nightly
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' ',
    show_file = true,
    click_support = function(node, clicks, button, modifiers)
      -- To see all avaiable details: vim.pretty_print(node)
      local st = node.range.start
      local en = node.range['end']
      if button == "l" then
        if clicks == 2 then
          -- double left click to do nothing
        else -- jump to node's starting line+char
          vim.fn.cursor(st.line + 1, st.character + 1)
        end
      elseif button == "r" then
        if modifiers == "s" then
          print "lspsaga" -- shift right click to print "lspsaga"
        end -- jump to node's ending line+char
        vim.fn.cursor(en.line + 1, en.character + 1)
      elseif button == "m" then
        -- middle click to visual select node
        vim.fn.cursor(st.line + 1, st.character + 1)
        vim.cmd "normal v"
        vim.fn.cursor(en.line + 1, en.character + 1)
      end
    end,
  },
  -- show outline
  show_outline = {
    win_position = 'right',
    -- set the special filetype in there which in left like nvimtree neotree defx
    left_with = '',
    win_width = 100,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  -- custom lsp kind
  -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
  custom_kind = {},
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = { metals = { "sbt", "scala" } }
  server_filetype_map = {},
}) ]]
