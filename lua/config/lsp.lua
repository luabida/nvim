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

local function isempty(s)
  return s == nil or s == ""
end

local function use_if_defined(val, fallback)
  return val ~= nil and val or fallback
end

if utils.executable("pylsp") then
  local conda_prefix = os.getenv("CONDA_PREFIX")

  if not isempty(conda_prefix) then
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python3")
  else
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
  end

  require("lspconfig").pylsp.setup({
    on_attach = on_attach,
    settings = {
      pylsp = {
        plugins = {
          -- formatter options
          black = { enabled = true },
          autopep8 = { enabled = true },
          yapf = { enabled = true },
          -- linter options
          pylint = {
            enabled = false,
            executable = "pylint",
            report_progress = false,
          },
          pylint_django = {
            enabled = true,
            executable = "djlint",
            overrides = { "--python-executable", vim.g.python3_host_prog, true },
          },
          ruff = {
            enabled = true,
            report_progress = false,
          },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          -- type checker
          pylsp_mypy = {
            enabled = true,
            overrides = { "--python-executable", vim.g.python3_host_prog, true },
            report_progress = true,
            live_mode = false,
            -- auto-completion options
          },
          jedi_completion = { enabled = false, fuzzy = true },
          -- import sorting
          isort = { enabled = true },
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
    capabilities = capabilities,
  })
else
  if vim.api.nvim_buf_get_option(0, "filetype") == "python" then
    vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
  end
end

if utils.executable("jedi-language-server") then
  local conda_prefix = os.getenv("CONDA_PREFIX")

  if not isempty(conda_prefix) then
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python3")
  else
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
  end
  require("lspconfig").jedi_language_server.setup({
    on_attach = on_attach,
    settings = {
      jedi = {
        autoImportModules = {},
        completion = {
          enabled = true,
          fuzzy = true,
        },
        diagnostics = {
          enabled = true,
        },
        jediSettings = {
          autoImportModules = {},
          completion = {
            enabled = true,
            fuzzy = true,
          },
          diagnostics = {
            enabled = true,
          },
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
    capabilities = capabilities,
  })
else
  if vim.api.nvim_buf_get_option(0, "filetype") == "python" then
    vim.notify("jedi-language-server not found!", vim.log.levels.WARN, { title = "Nvim-config" })
  end
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
