
-- [[ Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

function Autocmd(cmd)
    vim.api.nvim_create_autocmd(cmd.events, cmd.opts)
end

-- to run programs
require 'utils.runcmds'

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
Autocmd {
    events = 'TextYankPost',
    opts = {
        pattern = '*',
        desc = 'Highlight when yanking (copying) text',
        callback = function ()
            vim.highlight.on_yank {
                higroup = 'IncSearch',
                timeout = 200,
            }
        end
    },
}

if Bootstrap then
    return
end

-- Open project selection when a blank 'nvim' is launched
Autocmd {
    events = "UIEnter",
    opts = {
        callback = function()
            local function display_projects()
                if vim.fn.argc() == 0 and vim.bo.filetype ~= "terminal" then
                    vim.cmd.cd(PROJECTS_DIR)
                    require('plugins.edit.telescope').startpicker.display()
                end
            end
            vim.schedule(display_projects) -- run the function when possible (UIEnter is a busy time)
        end
    }
}
