return {
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    opts = function(_, opts)
      opts.options = {
        disabled_filetypes = {
          statusline = { "dashboard", "lazy", "neo-tree" },
        },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    after = "catppuccin",
    opts = function()
      require("bufferline").setup({
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      })
    end,
  },
}
