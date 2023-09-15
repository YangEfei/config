return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      keys = {
        { "<cr>", desc = "Increment selection" },
        { "<bs>", desc = "Schrink selection", mode = "x" },
      },
      ensure_installed = {
        "bash",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "vim",
        "yaml",
        "vimdoc",
        "c",
        "cpp",
      },
      -- 启用增量选择
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          scope_incremental = "<tab>",
          node_decremental = "<bs>",
        },
      },
      -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
      indent = {
        enable = true,
      },
    },
  },
}
