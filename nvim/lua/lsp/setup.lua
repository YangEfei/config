-- local lsp_installer = require "nvim-lsp-installer"
require("nvim-lsp-installer").setup({
  -- 自动安装 Language Servers
  automatic_installation = true,
})
local lspconfig = require("lspconfig")

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
  sumneko_lua = require("lsp.config.lua"), -- /lua/lsp/config/lua.lua
  -- clangd = require("lsp.config.clangd"),
  ccls = require("lsp.config.ccls"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    config.on_setup(lspconfig[name])
  else
    lspconfig[name].setup({})
  end
end
