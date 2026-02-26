if vim.g.neovide then
  vim.o.guifont = "jetBrainsMono Nerd Font"
end

vim.cmd.source("~/.vimrc")

require("config.lazy")

require("autocmds")
require("keymaps")
require("highlights")
