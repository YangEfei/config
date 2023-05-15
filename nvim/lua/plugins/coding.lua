return {
  -- add Comment
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
  },
  -- add nvim-surround
  {
    "kylechui/nvim-surround",
    opts = {
      keymaps = {
        insert = false,
        insert_line = false,
        normal = "<leader>ys",
        normal_cur = "<leader>yss",
        normal_cur_line = "<leader>ySS",
        visual = "<leader>ys",
        visual_line = "<leader>yS",
        delete = "<leader>yd",
        change = "<leader>yc",
      },
    },
  },
}
