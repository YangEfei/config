local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end
local home = os.getenv('HOME')

db.custom_header = {
    '          ▀████▀▄▄              ▄█ ',
    '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
    '    ▄        █          ▀▀▀▀▄  ▄▀  ',
    '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
    '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
    '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
    '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
    '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
    '   █   █  █      ▄▄           ▄▀   ',
}
db.custom_center = {
  {icon = '  ',
  desc = 'Recently opened projects                ',
  shortcut = 'SPC o p',
  action ='Telescope projects'},
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'Telescope oldfiles',
  shortcut = 'SPC o f'},
  {icon = '  ',
  desc = 'Find File                               ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc ='File Browser                            ',
  action =  'NvimTreeToggle',
  shortcut = 'SPC f b'},
  {icon = '  ',
  desc = 'Find word                               ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'},
  {icon = '  ',
  desc = 'Open Personal dotfiles                  ',
  action = 'Telescope dotfiles',
  shortcut = 'SPC o d'},
}
