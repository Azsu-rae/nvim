
local M = {}

M.in_windows = vim.uv.os_uname().sysname == "Windows_NT"

if M.in_windows then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

M.vimrc = M.in_windows and "~/_vimrc" or "~/.vimrc"

return M
