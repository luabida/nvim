return {
  {
    "kiyoon/jupynium.nvim",
    build = "m --no-capture-output -n jupynium pip install .",
    enabled = vim.fn.isdirectory(vim.fn.expand("~/micromamba/envs/jupynium")),
  },
  "rcarriga/nvim-notify",
  "stevearc/dressing.nvim",
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                reportMissingTypeStubs = false,
                reportUnknownMemberType = false,
                reportUnknownArgumentType = false,
              },
            },
          },
        },
        ruff = {
          on_attach = function(client, bufnr)
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.definitionProvider = false
            client.server_capabilities.referencesProvider = false
          end,
        },
        djls = {
          filetypes = { "htmldjango", "html" },
        },
      },
    },
  },
}
