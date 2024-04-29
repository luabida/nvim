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
  {
    "folke/noice.nvim",
    opts = {
      views = { mini = { timeout = 10000, lang = "markdown" } },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "lsp",
            kind = "progress",
            -- find = 'null-l',
          },
          opts = { skip = true, stop = true },
        },
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
  },
}
