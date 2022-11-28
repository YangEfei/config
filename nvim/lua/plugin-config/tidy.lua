local status, tidy = pcall(require, "tidy")
if not status then
  vim.notify("没有找到 tidy")
  return
end

tidy.setup({
  filetype_exclude = { "markdown", "diff" },
})

