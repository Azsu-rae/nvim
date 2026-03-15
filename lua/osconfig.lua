
local M = {}

M.in_win = (vim.fn.has("win32") == 1)
M.ext = M.in_win and "ps1"  or "sh"

if M.in_win then
  vim.o.shell = "pwsh"
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

return M
