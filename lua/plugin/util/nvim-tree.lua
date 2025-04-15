
require('nvim-tree').setup({
    hijack_netrw = true,
    auto_reload_on_write = true,
    view = {
        width = 35,         -- Set width of the sidebar
        side = "left",      -- Sidebar on the left
    },
--    renderer = {
--        icons = {
--            show = {
--                git = true, -- Show Git status icons
--                folder = true,
--                file = true,
--                folder_arrow = true,
--            },
--            glyphs = {
--                default = "",
--                folder = {
--                    arrow_closed = "",
--                    arrow_open = "",
--                    default = "",
--                    open = "",
--                    empty = "",
--                    empty_open = "",
--                    symlink = "",
--                }
--            },
--        },
--    },
    actions = {
        open_file = {
           quit_on_open = false, -- Close tree when selecting a file
        },
        use_system_clipboard = true,
    },
    git = {
        enable = true, -- Enable Git integration
    },
    on_attach = function(bufnr)

        local api = require 'nvim-tree.api'

        -- Load default keybindings first
        api.config.mappings.default_on_attach(bufnr)

        local function opts(desc)
            return {desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
        end

        -- custom mappings
        vim.keymap.set('n', 'y', api.fs.copy.node, opts("Copy Name"))
        vim.keymap.set('n', 'p', api.fs.paste, opts("Paste File"))
        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_node, opts('Up'))
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    end,
})
