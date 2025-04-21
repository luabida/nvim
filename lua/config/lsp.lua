local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
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

local function setup_conda()
  local conda_prefix = os.getenv("CONDA_PREFIX")

  local function isempty(s)
    return s == nil or s == ""
  end

  local function use_if_defined(val, fallback)
    return val ~= nil and val or fallback
  end

  if utils.executable("pylsp") then
    if not isempty(conda_prefix) then
      vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
      vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python3")
    else
      vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
      vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
    end
  end
end

if utils.executable("pyllsp") then
  setup_conda()

  if not configs.pyllsp then
    configs.pyllsp = {
      default_config = {
        cmd = { "pyllsp" },
        filetypes = { "python" },
        root_dir = lspconfig.util.root_pattern(".git", "pyproject.toml"),
      },
    }
  end

  lspconfig.pyllsp.setup({
    on_attach = on_attach,
  })
elseif utils.executable("pylsp") then
  setup_conda()

  require("lspconfig").pylsp.setup({
    on_attach = on_attach,
    settings = {
      pylsp = {
        plugins = {
          -- formatter options
          black = { enabled = true },
          autopep8 = { enabled = true },
          yapf = { enabled = false },
          -- linter options
          pylint = {
            enabled = true,
            executable = vim.g.python3_host_prog .. "/../pylint",
            report_progress = false,
            args = {
              "--load-plugins=pylint_celery",
            },
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
            enabled = false,
            overrides = { "--python-executable", vim.g.python3_host_prog, true },
            report_progress = true,
            live_mode = false,
            -- auto-completion options
            auto_completion = false,
          },
          jedi_completion = { enabled = true },
          -- import sorting
          isort = { enabled = false },
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
    capabilities = capabilities,
  })
else
  vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
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

require("lspconfig")["dockerls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
