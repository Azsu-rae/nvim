vim.keymap.set("n", "<leader>o", function()
  local file = vim.fn.expand("%:p")
  local open = require("osconfig").in_win and "Start-Process msedge.exe" or "xdg-open"
  vim.notify(string.format("split | term %s %s", open, file))
  vim.cmd(string.format("split | term %s %s", open, file))
end, { desc = "[O]pening in browser" })
