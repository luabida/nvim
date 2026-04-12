return {
  {
    "mason-org/mason.nvim",
    init = function()
      require("config.mason")
    end,
    lazy = false,
  },
  "mason-org/mason-lspconfig.nvim",
  {
    "smjonas/inc-rename.nvim",
    opts = {},
    event = "BufReadPost",
  },
}
