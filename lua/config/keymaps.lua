-- Keybindings
local silent = { silent = true, noremap = true }

vim.keymap.set('n', '<c-n>', '<cmd>Neotree<CR>')

-- Quit, close buffers, etc.
vim.keymap.set('n', '<leader>Q', '<cmd>qa<cr>', silent)
vim.keymap.set('n', '<leader>d', '<cmd>bufdel<cr>', { silent = true, nowait = true, noremap = true })

-- Save buffer
vim.keymap.set('i', '<c-s>', '<esc><cmd>w<cr>a', silent)
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', silent)

-- Version control
vim.keymap.set('n', 'gs', '<cmd>Neogit<cr>', silent)

-- Yank to clipboard
vim.keymap.set('n', '<c-y>', '<cmd>set opfunc=util#clipboard_yank<cr>g@', silent)
vim.keymap.set('v', '<c-Y>', '<cmd>set opfunc=util#clipboard_yank<cr>g@', silent)

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)

-- Window movement
vim.keymap.set('n', '<c-h>', '<c-w>h', silent)
vim.keymap.set('n', '<c-j>', '<c-w>j', silent)
vim.keymap.set('n', '<c-k>', '<c-w>k', silent)
vim.keymap.set('n', '<c-l>', '<c-w>l', silent)

-- Tab movement
vim.keymap.set('n', '<S-tab>', '<cmd>tabpre<cr>', silent)
vim.keymap.set('n', '<tab>', '<cmd>tabnext<cr>', silent)
vim.keymap.set('n', '<leader>q', '<cmd>tabclose<cr>', silent)

-- Make relative line jumps store jumplist locations
vim.keymap.set('n', 'k', function()
  if vim.v.count > 1 then
    return [[m']] .. vim.v.count .. 'k'
  end

  return 'k'
end, { expr = true, silent = true })

vim.keymap.set('n', 'j', function()
  if vim.v.count > 1 then
    return [[m']] .. vim.v.count .. 'j'
  end

  return 'j'
end, { expr = true, silent = true })
