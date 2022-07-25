local lspconfig_opts = {
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = {
    debounce_text_changes = 150,
  },
  extensions = {
    -- defaults:
    -- Automatically set inlay hints (type hints)
    autoSetHints = false,
    -- These apply to the default ClangdSetInlayHints command
    inlay_hints = {
      -- Only show inlay hints for the current line
      only_current_line = true,
      -- Event which triggers a refersh of the inlay hints.
      -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
      -- not that this may cause  higher CPU usage.
      -- This option is only respected when only_current_line and
      -- autoSetHints both are true.
      only_current_line_autocmd = "CursorHold",
      -- whether to show parameter hints with the inlay hints or not
      show_parameter_hints = true,
      -- prefix for parameter hints
      parameter_hints_prefix = "<- ",
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",
      -- whether to align to the length of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 7,
      -- The color of the hints
      highlight = "Comment",
      -- The highlight group priority for extmark
      priority = 100,
    },
    ast = {
      role_icons = {
        type = "",
        declaration = "",
        expression = "expr",
        specifier = "spec",
        statement = "stat",
        ["template argument"] = "tmp",
      },
      kind_icons = {
        Compound = "Com",
        Recovery = "Rec",
        TranslationUnit = "Trans",
        PackExpansion = "Pack",
        TemplateTypeParm = "TemTP",
        TemplateTemplateParm = "Tem",
        TemplateParamObject = "TemPO",
      },
      highlights = {
        detail = "Comment"
      }
    },
    memory_usage = {
      border = "none",
    },
    symbol_info = {
      border = "none",
    },
  },

  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- 绑定快捷键
    require("keybindings").mapLSP(buf_set_keymap)
  end,
}

return {
  on_setup = function(server)
    local ok_rt, clangd_ext = pcall(require, "clangd_extensions")
    if not ok_rt then
      print("Failed to load clangd_extensions.")
      server.setup(lspconfig_opts)
    else
      clangd_ext.setup({
        server = lspconfig_opts,
      })
    end
  end
}
