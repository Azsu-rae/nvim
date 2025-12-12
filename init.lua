
vim.cmd.source("~/.vimrc")

vim.lsp.enable({"pylsp", "lua_ls"})
vim.diagnostic.config {
    virtual_text = true
}
