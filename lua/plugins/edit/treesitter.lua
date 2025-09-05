
local M = {}

local config = {
    ensure_installed = {"c", "cpp", "java", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"},
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        disable = function(_, buf) -- To disable slow treesitter highlight for large files
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then return true end
        end,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}

M.setup = function()
    require('nvim-treesitter.configs').setup(config)
end

return M
