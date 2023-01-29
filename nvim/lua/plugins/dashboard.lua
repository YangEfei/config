return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  opts = {
    theme = "hyper",
    config = {
      week_header = {
        enable = true,
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
    },
  },
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
