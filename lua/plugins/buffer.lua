return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config.treesitter")
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    init = function()
      require("config.neotree")
    end,
  },
  {
    "andymass/vim-matchup",
    init = function()
      require("config.matchup")
    end,
    lazy = false,
  },
  "tpope/vim-repeat",
  {
    "echasnovski/mini.move",
    init = function()
      require("config.mini")
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      backends = { "lsp", "treesitter", "markdown", "man" },
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    },
    cmd = { "AerialOpen", "AerialToggle" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    {
      "utilyre/barbecue.nvim",
      event = "User ActuallyEditing",
      name = "barbecue",
      version = "*",
      dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
      },
      opts = {
        create_autocmd = false,
        attach_navic = false,
        show_modified = true,
        exclude_filetypes = { "netrw", "toggleterm", "NeogitCommitMessage" },
        custom_section = function()
          -- Copied from @akinsho's config
          local error_icon = "" -- '✗'
          local warning_icon = ""
          local info_icon = "" --  
          local hint_icon = "⚑" --  ⚑
          local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
          local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
          local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
          local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
          local components = {}
          if errors > 0 then
            components[#components + 1] = { error_icon .. " " .. errors, "DiagnosticError" }
          end

          if warnings > 0 then
            components[#components + 1] =
              { (#components > 0 and " " or "") .. warning_icon .. " " .. warnings, "DiagnosticWarning" }
          end

          if hints > 0 then
            components[#components + 1] =
              { (#components > 0 and " " or "") .. hint_icon .. " " .. hints, "DiagnosticHint" }
          end

          if info > 0 then
            components[#components + 1] =
              { (#components > 0 and " " or "") .. info_icon .. " " .. info, "DiagnosticInfo" }
          end

          return components
        end,
      },
    },
  },
  {
    "DNLHC/glance.nvim",
    cmd = "Glance",
    config = function()
      require("glance").setup({
        detached = true,
        border = { enable = true, top_char = "─", bottom_char = "─" },
        theme = { mode = "brighten" },
        indent_lines = { icon = "│" },
        winbar = { enable = true },
      })
    end,
  },
}
