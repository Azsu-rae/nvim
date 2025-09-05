
local M = {}

local config = {
    ft = "lua",
    library = {
        {
            path = "${3rd}/luv/library",
            words = {"vim%.uv"}
        },
    },
}

M.setup = function()
    require("lazydev").setup(config)
end

return M
