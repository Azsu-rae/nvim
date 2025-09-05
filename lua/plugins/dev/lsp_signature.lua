
local M = {}

local lsp_signature_config = {
    bind = true,
    handler_opts = { border = "rounded" },
    hint_prefix = "🔍 ",
    hint_scheme = "String",
    floating_window = true,
    floating_window_above_cur_line = true,
    max_height = 12,
    max_width = 80,
    always_trigger = false,
    toggle_key = '<M-s>',           -- Toggle signature help
    select_signature_key = '<M-n>', -- Cycle signatures
}

M.setup = function ()
    -- Configure lsp_signature.nvim for function signatures
    require('lsp_signature').setup(lsp_signature_config)
end

return M
