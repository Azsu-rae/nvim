

local in_win = (vim.fn.has("win32") == 1)

local vimrc = in_win and "~/_vimrc" or "~/.vimrc"
vim.cmd.source(vimrc)

if in_win then
  vim.o.shell = "powershell"
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end
