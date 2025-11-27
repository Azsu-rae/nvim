
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
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.schedule(function ()

            if vim.fn.argc() ~= 0 then return end

            local ui = vim.api.nvim_list_uis()[1]
            local lines = {}

            while #lines < ui.height do
                table.insert(lines, "")
            end

            local buf = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

            vim.api.nvim_buf_set_option(0, "number", false)
            vim.api.nvim_buf_set_option(0, "relativenumber", false)
            vim.api.nvim_buf_set_option(0, "signcolumn", "no")
            vim.api.nvim_buf_set_option(0, "cursorline", false)

            vim.bo[buf].buftype = "nofile"
            vim.bo[buf].bufhidden = "hide"
            vim.bo[buf].swapfile = false
            vim.bo[buf].modifiable = true
            vim.bo[buf].filetype = "scratch"

            vim.cmd.cd(PROJECTS_DIR)
            require('plugins.edit.telescope').startpicker.display()
        end)
    end
})
