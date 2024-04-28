return {
  {
    "williamboman/mason.nvim",
    init = function()
      require("config.mason")
    end,
    lazy = false,
  },
  "williamboman/mason-lspconfig.nvim",
  {
    "smjonas/inc-rename.nvim",
    opts = {},
    event = "BufReadPost",
  },
}
