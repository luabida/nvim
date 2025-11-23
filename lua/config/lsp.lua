local lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function() end

for _, server in ipairs({
  "cssls",
  "yamlls",
  "emmet_ls",
  "tsserver",
  "lua_ls",
  "bashls",
  "hls",
  "dockerls",
}) do
  lsp[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lsp.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { maxLineLength = 80 },
      },
    },
  },
})
