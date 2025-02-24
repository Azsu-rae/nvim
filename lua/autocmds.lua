
-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',  -- Use the 'IncSearch' highlight group
            timeout = 200           -- Highlight duration in milliseconds
        })
    end
})

-- Automatically open nvim-tree
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        vim.schedule(function()
            local api = require("nvim-tree.api")
            -- Ensure nvim-tree opens only if no file is opened
            if vim.fn.argc() == 0 and vim.bo.filetype ~= "terminal" then
                -- Open nvim-tree and maximize it
                api.tree.open()
                vim.cmd('wincmd o') -- Make nvim-tree fullscreen
            end
        end)
    end
})

--vim.api.nvim_create_autocmd("FileType", {
--    pattern = "java",
--    callback = function()
--        require 'plugins.nvim-jdtls'
--    end
--})
