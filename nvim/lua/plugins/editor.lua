return {
  -- add telescope-fzf-native
  {
    "telescope.nvim",
    opts = function()
      return {
        defaults = {
          dynamic_preview_title = true,
        },
      }
    end,
  },
  {
    "fzf-lua",
    opts = {
      fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
      },
    },
    keys = {
      { "<leader><space>", LazyVim.pick("files", { line_query = true }), desc = "Find Files (Root Dir)" },
      { "<leader>ff", LazyVim.pick("files", { line_query = true }), desc = "Find Files (Root Dir)" },
      { "<leader>fF", LazyVim.pick("files", { root = false, line_query = true }), desc = "Find Files (cwd)" },
      { "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd(), line_query = true }), desc = "Recent (cwd)" },
    }
  },
  -- modify which-key register map
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>y", group = "surround" }, -- group
      })
    end,
  },
  -- modify telescope keymaps
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
          },
        },
      },
    },
  },

  -- add git-messenger
  {
    "rhysd/git-messenger.vim",
    event = "BufReadPre",
    keys = {
      { "<leader>gm", "<cmd>GitMessenger<cr>", desc = "Blame line history" },
    },
  },

  -- moidfy gitsigns
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        -- add = { hl = "GitSignsAdd", text = "A|", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        -- change = { hl = "GitSignsChange", text = "C|", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        -- delete = { hl = "GitSignsDelete", text = "D_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        -- topdelete = { hl = "GitSignsDelete", text = "D‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        -- changedelete = { hl = "GitSignsChange", text = "D~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        -- untracked = { hl = "GitSignsAdd", text = "A┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>gb", function()
          gs.blame_line({ full = true })
        end, "Blame Line")
        map("n", "<leader>gd", gs.diffthis, "Diff This")
        map("n", "<leader>gD", function()
          gs.diffthis("~")
        end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        map("n", "<leader>gt", function()
          gs.toggle_current_line_blame()
        end, "Toggle blame Line")
      end,
    },
  },
}
