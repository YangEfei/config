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
}
