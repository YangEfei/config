return {
  -- add Comment
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
  },
  -- add nvim-surround
  {
    "kylechui/nvim-surround",
    opts = {
      keymaps = {
        insert = "<leader>ys",
        insert_line = "<leader>yS",
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
