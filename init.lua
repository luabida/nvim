-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("autocmd BufNewFile,BufRead *.py set filetype=python")
vim.cmd("set foldmethod=manual")

-- Fix bufferline + opencode winfixbuf E1513 conflict
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local ft = vim.bo.filetype or ""
    if ft ~= "opencode_output" and ft ~= "opencode_input" then
      pcall(vim.api.nvim_set_option_value, "winfixbuf", false, { win = 0 })
    end
  end,
  desc = "Clear winfixbuf from non-opencode windows",
})
