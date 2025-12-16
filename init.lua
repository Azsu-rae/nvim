
vim.cmd.source("~/.vimrc")

vim.lsp.enable({"pylsp", "lua_ls"})
vim.diagnostic.config {
    virtual_text = true
}

vim.pack.add {
    'https://github.com/EdenEast/nightfox.nvim',
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/mason-org/mason.nvim',
}

require('mason').setup()

require('nvim-treesitter').install {'python', 'lua'}
--vim.cmd.colorscheme('carbonfox')

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

vim.api.nvim_create_autocmd('PackChanged', {
    pattern = '*',
    callback = function ()
        vim.cmd('TSUpdate')
    end
})

vim.keymap.set("n", "<leader>st", function()
    local win_id = vim.api.nvim_get_current_win()
    vim.cmd('tab split')
    vim.api.nvim_win_close(win_id, true)
end, { desc="[S]plit into a new [T]ab" })

