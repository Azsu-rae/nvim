
vim.cmd.source("~/.vimrc")

vim.lsp.enable({"pylsp", "lua_ls"})
vim.diagnostic.config {
    virtual_text = true
}

vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    desc = 'Highlight when yanking (copying) text',
    callback = function ()
        vim.highlight.on_yank {
            higroup = 'IncSearch',
            timeout = 200,
        }
    end
})
