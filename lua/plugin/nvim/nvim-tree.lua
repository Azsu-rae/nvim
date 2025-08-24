
require('nvim-tree').setup {
    hijack_netrw = true,
    auto_reload_on_write = true,
    filters = {
        dotfiles = false,
    },
    view = {
        width = 35,         -- Set width of the sidebar
        side = "left",      -- Sidebar on the left
    },
    actions = {
        open_file = {
           quit_on_open = false, -- Close tree when selecting a file
        },
        use_system_clipboard = true,
    },
    git = {
        enable = true, -- Enable Git integration
        ignore = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
}
