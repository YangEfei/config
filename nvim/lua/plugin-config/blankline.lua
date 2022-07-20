local status, blankline = pcall(require, "indent_blankline")
if not status then
  vim.notify("没有找到 indent_blankline")
  return
end

-- 设置上下文高亮颜色
vim.cmd [[highlight IndentBlanklineContextChar guifg=#61AFEF gui=nocombine]]

blankline.setup({
  show_current_context = true,
  show_current_context_start = true,
  char_list = {'|', '¦', '┆', '┊'}
})
