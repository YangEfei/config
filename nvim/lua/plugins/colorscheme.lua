return {
  -- Configure LazyVim to load  colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- gruvbox
  { "ellisonleao/gruvbox.nvim", lazy = true, name = "gruvbox" },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      dim_inactive = {
        enabled = true,
        shade = "light",
        percentage = 0.1,
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        telescope = true,
        noice = true,
        notify = true,
        mini = true,
        mason = true,
        treesitter = true,
        lsp_trouble = true,

        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
  },
}
