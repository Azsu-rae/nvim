
function Autocmd(cmd)
    vim.api.nvim_create_autocmd(cmd.events, cmd.opts)
end

-- keymaps to compile and run
require 'util.runcmds'

-- Highlight yanked text
Autocmd {
    events = 'TextYankPost',
    opts = {
        pattern = '*',
        callback = function ()
            vim.highlight.on_yank {
                higroup = 'IncSearch',
                timeout = 200,
            }
        end
    },
}

Autocmd {
events = 'User',
    opts = {
        pattern = 'PackerComplete',
        callback = function ()
            vim.notify("Please restart Neovim for setup completion!")
        end
    },
}

if Cashe.bootstrap then
    return
end

-- Open project selection when a blank 'nvim' is launched
Autocmd {
    events = "UIEnter",
    opts = {
        callback = function()
            local display_projects = function ()
                if Vimscript.argc() == 0 and vim.bo.filetype ~= "terminal" then
                    require("util.projects_picker").display()
                end
            end
            vim.schedule(display_projects) -- run the function when possible (UIEnter is a busy time)
        end
    }
}

-- eclipse.jdt.ls launch when we enter a .java file
Autocmd {
    events = "FileType",
    opts = {
        pattern = "java",
        callback = function ()

            local jdtls = require('util.jdtls')
            if not jdtls.installed then
                vim.notify("eclipse.jdt.ls is not installed, install via mason")
                return
            end

            require('jdtls').start_or_attach(jdtls.config)
        end,
    }
}

-- Prevents syntax overriding 
-- Autocmd {
--     events = "LspAttach",
--     opts = {
--         callback = function(args)
--             local client = vim.lsp.get_client_by_id(args.data.client_id)
--             if client then
--                 client.server_capabilities.semanticTokensProvider = nil
--             end
--         end
--     }
-- }
