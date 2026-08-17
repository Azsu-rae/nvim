vim.cmd.source(vim.fn.stdpath("config") .. "/vimrc")
require("vim._core.ui2").enable({})

require("osconfig")
require("editor")

require("config.lazy")
require("lsp")

require("autocmds")
require("keymaps")
require("highlights").set_transparent_bg()

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.opt.foldlevel = 99
