return {
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    opts = function(_, opts)
      opts.options = {
        disabled_filetypes = {
          statusline = { "dashboard", "lazy", "neo-tree" },
          winbar = { "dashboard", "lazy", "neo-tree" },
        },
      }
      -- remove navic from the statusline
      local navic = table.remove(opts.sections.lualine_c)
      -- add it to the winbar instead
      opts.winbar = { lualine_a = { "filename" }, lualine_c = { navic } }
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
