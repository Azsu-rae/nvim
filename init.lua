vim.cmd.source(vim.fn.stdpath("config") .. "/vimrc.vim")
require("vim._core.ui2").enable({})

require("osconfig")
require("ft")
require("editor")

require("config.lazy")

require("autocmds")
require("keymaps")
require("highlights").set_transparent_bg()
