return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper", --  theme is doom and hyper default is hyper
      shortcut_type = "letter", --  shorcut type 'letter' or 'number'
      config = {
        disable_move = true, --  default is false disable move keymap for hyper
        header = {
          "",
          "",
          "",
          " ██████╗  ██████╗███████╗ █████╗ ███╗   ██╗██████╗  █████╗ ███████╗███████╗",
          "██╔═══██╗██╔════╝██╔════╝██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔════╝██╔════╝",
          "██║   ██║██║     █████╗  ███████║██╔██╗ ██║██████╔╝███████║███████╗█████╗  ",
          "██║   ██║██║     ██╔══╝  ██╔══██║██║╚██╗██║██╔══██╗██╔══██║╚════██║██╔══╝  ",
          "╚██████╔╝╚██████╗███████╗██║  ██║██║ ╚████║██████╔╝██║  ██║███████║███████╗",
          " ╚═════╝  ╚═════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝",
          "",
          "",
          "",
        },
        shortcut = {
          { desc = "󰚰 Update", group = "@property", action = "Lazy update", key = "u" },
          {
            desc = " Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = " Grep",
            group = "Number",
            action = "Telescope live_grep",
            key = "g",
          },
          -- {
          --   desc = ' dotfiles',
          --   group = 'Number',
          --   action = 'Telescope dotfiles',
          --   key = 'd',
          -- },
        },
        footer = { "", "💪 Good good study, day day up ~" },
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
