local lspsaga = require("lspsaga")
lspsaga.init_lsp_saga({
  -- Options with default value
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "single",
  --the range of 0 for fully opaque window (disabled) to 100 for fully
  --transparent background. Values between 0-30 are typically most useful.
  saga_winblend = 0,
  -- diagnostic sign
  -- diagnostic_header = { "😡", "😥", "😤", "😐" },
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  show_diagnostic_source = true,
  -- add bracket or something with diagnostic source, just have 2 elements
  diagnostic_source_bracket = {},
  -- code action title icon
  code_action_icon = "ﯦ ",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = true,
    sign = true,
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
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 10,
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
  rename_action_quit = "<ESC>",
  definition_preview_icon = " ",
  server_filetype_map = {},
  -- show symbols in winbar must nightly
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' ',
    show_file = true,
    click_support = true,
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
})
