return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "ruff",
        "black",
        "djlint",
      },
    },
  },
  "mason-org/mason-lspconfig.nvim",
}
