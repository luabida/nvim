local lspconfig = require("lspconfig")
local utils = require("utils")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }
end

if utils.executable("rust-analyzer") then
  local rust_analyzer_executable = "rust-analyzer"
  require("lspconfig")["rust_analyzer"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { rust_analyzer_executable },
    settings = {
      checkOnSave = {
        command = "clippy",
      },
      ["rust-analyzer"] = {
        assist = {
          importMerge = true,
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
  })
else
  vim.notify("rust-analyzer not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
  },
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["lua_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["bashls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["hls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["marksman"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "marksman", "server" },
})

require("lspconfig")["dockerls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
