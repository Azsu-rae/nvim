
local M = {}

local config = {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
}

M.setup = function()
    require("gitsigns").setup(config)
end

return M
