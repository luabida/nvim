local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)          --> jumps to the definition of the symbol under the cursor
  buf_set_keymap("n", "H", ":lua vim.lsp.buf.hover()<CR>", opts)                --> information about the symbol under the cursos in a floating window
  buf_set_keymap("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)      --> lists all the implementations for the symbol under the cursor in the quickfix window
  buf_set_keymap("n", "<leader>ra", ":lua vim.lsp.util.rename()<CR>", opts)     --> renaname old_fname to new_fname
  buf_set_keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) --> selects a code action available at the current cursor position
  buf_set_keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)          --> lists all the references to the symbl under the cursor in the quickfix window
  buf_set_keymap("n", "<leader>ld", ":lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
  buf_set_keymap("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts) --> formats the current buffer
end

---@diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local parent_dir = "../"
package.path = package.path .. ";" .. parent_dir .. "?.lua"
local utils = require("utils")

if utils.executable("pylsp") then
  local conda_prefix = os.getenv("CONDA_PREFIX")

  local function isempty(s)
    return s == nil or s == ""
  end

  local function use_if_defined(val, fallback)
    return val ~= nil and val or fallback
  end

  if not isempty(conda_prefix) then
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, conda_prefix .. "/bin/python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, conda_prefix .. "/bin/python3")
  else
    vim.g.python_host_prog = use_if_defined(vim.g.python_host_prog, "python")
    vim.g.python3_host_prog = use_if_defined(vim.g.python3_host_prog, "python3")
  end

  require("lspconfig").pylsp.setup {
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
            enabled = true,
            executable = "pylint",
            report_progress = false,
          },
          ruff = {
            enabled = false,
            report_progress = false,
          },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          -- type checker
          pylsp_mypy = {
            enabled = true,
            overrides = { "--python-executable", vim.g.python3_host_prog, true },
            report_progress = true,
            live_mode = false
            -- auto-completion options
          },
          jedi_completion = { fuzzy = true },
          -- import sorting
          isort = { enabled = true },
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
    capabilities = capabilities,
  }
else
  vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end

require("lspconfig")["cssls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["yamlls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["emmet_ls"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

require("lspconfig")["tsserver"].setup({
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

require("lspconfig")["rust_analyzer"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    checkOnSave = {
      command = "clippy",
    }
  }
})
