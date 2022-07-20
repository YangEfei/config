local lspconfig_opts = {
  capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = {
    debounce_text_changes = 150,
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
