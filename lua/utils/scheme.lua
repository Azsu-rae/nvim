
local M = {}

M.use = function(name)

    vim.cmd.colorscheme(name)

    -- neovim colorscheme background in haxadecimal
    local hl = vim.api.nvim_get_hl(0, { name = "Normal" })
    local bg = string.format("#%06x", hl.bg)

    local path = "C:\\Users\\a50055268\\AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json"
    local file = vim.fn.readfile(path)
    local json_str = table.concat(file, "\n")
    local term_config = vim.fn.json_decode(json_str)
    local current_colorscheme = term_config.profiles.defaults.colorScheme
    for i, scheme in ipairs(term_config.schemes) do
        if scheme.name == current_colorscheme then
            term_config.schemes[i].background = bg
        end
    end
    local newjson = vim.fn.json_encode(term_config)
    vim.fn.writefile(vim.split(newjson, "\n"), path)
end

return M
