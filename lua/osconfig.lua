

local vimrc = vim.fn.has("win32") and "~/_vimrc" or "~/.vimrc"
vim.cmd.source(vimrc)

if vim.fn.has("win32") == 1 then
  vim.o.shell = "powershell"
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end
