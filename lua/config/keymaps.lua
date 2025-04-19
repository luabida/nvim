local silent = { silent = true, noremap = true }

vim.keymap.set("n", "<c-n>", "<cmd>Neotree toggle<CR>")

-- Yank to clipboard
vim.keymap.set("n", "<c-y>", "<cmd>set opfunc=util#clipboard_yank<cr>g@", silent)
vim.keymap.set("v", "<c-Y>", "<cmd>set opfunc=util#clipboard_yank<cr>g@", silent)

-- Save buffer
vim.keymap.set("i", "<c-s>", "<esc><cmd>w<cr>a", silent)
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", silent)

-- Quit, close buffers, etc.
vim.keymap.set("n", "<leader>d", "<cmd>tabclose<cr>", silent)

vim.keymap.set("n", "<leader>Q", "<cmd>qa<cr>", silent)
vim.keymap.set("n", "<leader>q", "<leader>bd", { remap = true, silent = true })

-- Tab movement
vim.keymap.set("n", "<S-tab>", "<cmd>tabprevious<cr>", silent)
vim.keymap.set("n", "<tab>", "<cmd>tabnext<cr>", silent)

-- Move

-- Window movement
vim.keymap.set("n", "<c-h>", "<c-w>h", silent)
vim.keymap.set("n", "<c-j>", "<c-w>j", silent)
vim.keymap.set("n", "<c-k>", "<c-w>k", silent)
vim.keymap.set("n", "<c-l>", "<c-w>l", silent)

-- quickfix
vim.keymap.set("n", "<leader><space>f", "<cmd> lua vim.lsp.buf.code_action()<cr>", silent)

-- rename
vim.keymap.set("n", "<leader>r", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Make relative line jumps store jumplist locations
vim.keymap.set("n", "k", function()
  if vim.v.count > 1 then
    return [[m']] .. vim.v.count .. "k"
  end

  return "k"
end, { expr = true, silent = true })

vim.keymap.set("n", "j", function()
  if vim.v.count > 1 then
    return [[m']] .. vim.v.count .. "j"
  end

  return "j"
end, { expr = true, silent = true })

-- Aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")

-- Glance
vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>")
vim.keymap.set("n", "gR", "<CMD>Glance references<CR>")
vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>")
vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>")
