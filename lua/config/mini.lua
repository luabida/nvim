require("mini.move").setup({
  mappings = {
    left = "<A-h>",
    right = "<A-l>",
    down = "",
    up = "",
    -- Move current line in Normal mode
    line_left = "<A-h>",
    line_right = "<A-l>",
    line_down = "",
    line_up = "",
  },
  options = {
    reindent_linewise = true,
  },
})
