return {
  {
    "neovim/nvim-lspconfig",
    autoformat = false,
    opts = {
      servers = {
        sumneko_lua = {
          mason = false
        },
        ccls = {
          mason = false
        }
      }
    }
  },
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
      { "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Jump to previous diagnostics" },
      { "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Jump to next diagnostics" },
      { "[E", function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end, desc = "Jump to previous error" },
      { "]E", function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end, desc = "Jump to next error" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming calls" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing calss" },
      { "<A-t>", "<cmd>Lspsaga term_toggle zsh<cr>", mode = { "n", "t" }, desc = "Float terminal" }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      opts.mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- super Tab
        ["<Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item()
          end
        end, { "i", "s" }),
        -- end of super Tab
      })
    end
  }
}
