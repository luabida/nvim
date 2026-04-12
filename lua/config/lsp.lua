local lsp = require("lspconfig")
local on_attach = function() end

lsp.pylsp.setup({
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { maxLineLength = 80 },
      },
    },
  },
})
