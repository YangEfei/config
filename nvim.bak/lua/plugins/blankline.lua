local status, blankline = pcall(require, "indent_blankline")
if not status then
  vim.notify("没有找到 indent_blankline")
  return
end

-- 设置上下文高亮颜色
vim.cmd [[highlight IndentBlanklineContextChar guifg=#61AFEF gui=nocombine]]

blankline.setup({
  -- 空行占位符
  space_char_blankline = " ",
  -- 使用 treesitter 判断上下文
  show_current_context = true,
  -- show_current_context_start = true,
  context_patterns = {
    "class",
    "function",
    "method",
    "element",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
  },
  -- 竖线样式
  char = '|'
  -- char_list = {'|', '¦', '┆', '┊'}
})
