return {
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    opts = function(_, opts)
      opts.options.disabled_filetypes = {
        statusline = { "dashboard", "lazy", "neo-tree" },
      }
    end,
  },
}
