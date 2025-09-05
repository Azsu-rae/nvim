
local M = {}
M.setup = function()
    -- Snippet engine
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_lua').load { -- For personal custom-made snippets
        paths = vim.fn.stdpath("config") .. "/LuaSnip/lua/snippets/",
    }
end

return M
