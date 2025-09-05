
local M = {}

local opts = {
    sync_root_with_cwd=true,
    actions = {
        open_file = {
            quit_on_open=true,
        },
    },
    update_focused_file = {
        enable=true,
    },
    filters = {
        git_ignored=false,
    },
}

M.setup = function()
    require('nvim-tree').setup(opts)
end

return M
