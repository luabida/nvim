-- providers
local enable_providers = {
  "python3_provider",
  "python3",
  "lua"
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

-- autosave when loose focus
-- vim.api.nvim_create_autocmd("BufLeave", {
--   pattern = {"*"},
--   event = "FocusLost",
--   callback = function ()
--     vim.cmd("write")
--   end
-- })
