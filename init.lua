vim.cmd.source(vim.fn.stdpath("config") .. "/vimrc.vim")
require("vim._core.ui2").enable({})

require("osconfig")
require("editor")

require("config.lazy")
require("lsp")

require("autocmds")
require("keymaps")
require("highlights").set_transparent_bg()
