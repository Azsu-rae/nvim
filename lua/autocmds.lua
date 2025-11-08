
-- [[ Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- to run programs
require 'utils.runcmds'

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local save = vim.fn.winsaveview()
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.winrestview(save)
    end,
})

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
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

if Bootstrap then
    return
end

-- Open project selection when a blank 'nvim' is launched
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        vim.schedule(function ()
            if vim.fn.argc() ~= 0 or vim.bo.filetype == "terminal" then return end
            vim.cmd.cd(PROJECTS_DIR)
            require('plugins.edit.telescope').startpicker.display()
        end)
    end
})
