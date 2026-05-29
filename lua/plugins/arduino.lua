return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "arduino-language-server",
        "clangd",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        arduino_language_server = {
          filetypes = { "arduino", "ino" },
          cmd = {
            "arduino-language-server",
            "-cli", vim.fn.exepath("arduino-cli"),
            "-clangd", vim.fn.exepath("clangd"),
            "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
            "-fqbn", "arduino:avr:uno",
          },
          capabilities = {
            textDocument = {
              ---@diagnostic disable-next-line: assign-type-mismatch
              semanticTokens = vim.NIL,
            },
            workspace = {
              ---@diagnostic disable-next-line: assign-type-mismatch
              semanticTokens = vim.NIL,
            },
          },
          root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            on_dir(require("lspconfig.util").root_pattern("*.ino")(fname))
          end,
        },
      },
    },
  },
}
