vim.cmd.source(vim.fn.stdpath("config") .. "/vimrc.vim")

require("osconfig")
require("editor")

require("config.lazy")

require("autocmds")
require("keymaps")
require("highlights")
