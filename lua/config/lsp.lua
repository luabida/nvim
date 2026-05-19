local lsp = require("lspconfig")
local on_attach = function() end

lsp.pyright.setup({
  on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
})
