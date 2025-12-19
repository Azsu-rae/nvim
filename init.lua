
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

vim.keymap.set("n", "<leader>st", function()
    local win_id = vim.api.nvim_get_current_win()
    vim.cmd('tab split')
    vim.api.nvim_win_close(win_id, true)
end, { desc="[S]plit into a new [T]ab" })
