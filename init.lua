if vim.g.neovide then
  vim.o.guifont = "jetBrainsMono Nerd Font"
end

local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
local vimrc = is_windows and "~/_vimrc" or "~/.vimrc"
vim.cmd.source(vimrc)

require("config.lazy")

require("autocmds")
require("keymaps")
require("highlights")
