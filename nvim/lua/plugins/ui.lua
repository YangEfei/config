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
    keys = {
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
      { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Pick Buffer Close" },
    },
    opts = function()
      require("bufferline").setup({
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      })
    end,
  },
}
