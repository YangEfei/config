return {
  -- add ccls to lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      servers = {
        ccls = {
          mason = false,
        },
      },
    },
  },

  -- add formatter and diagnostics for c/cpp
  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     return {
  --       on_init = function(new_client, _)
  --         new_client.offset_encoding = "utf-32"
  --       end,
  --       debug = true,
  --       sources = vim.list_extend(opts.sources or {}, {
  --         nls.builtins.formatting.clang_format.with({
  --           extra_args = {
  --             "-style=file:" .. vim.fn.expand("$HOME/.config/.clang_format"),
  --           },
  --         }),
  --       }),
  --     }
  --   end,
  -- },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        json = { "fixjson" },
        lua = { "stylua" },
        cpp = { "clang_format" },
      },
      formatters = {
        clang_format = {
          prepend_args = {
            "-style=file:" .. vim.fn.expand("$HOME/.config/.clang_format"),
          },
        },
      },
    },
  },

  --[[
  -- add lspsaga
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
    dpendencies = { { "nvim-tree/nvim-web-devicons" } },
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<cr>", desc = "LSP finder" },
      -- { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
      -- { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show line diagnostics" },
      { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Show cursor diagnostics" },
      { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Show buffer diagnostics" },
      -- { "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Jump to previous diagnostics" },
      -- { "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Jump to next diagnostics" },
      -- {
      --   "[E",
      --   function()
      --     require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      --   end,
      --   desc = "Jump to previous error",
      -- },
      -- {
      --   "]E",
      --   function()
      --     require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
      --   end,
      --   desc = "Jump to next error",
      -- },
      -- { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming calls" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing calss" },
      { "<A-t>", "<cmd>Lspsaga term_toggle zsh<cr>", mode = { "n", "t" }, desc = "Float terminal" },
    },
  },
  --]]

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
