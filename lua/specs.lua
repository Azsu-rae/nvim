
-- for _, scheme in ipairs(vim.fn.getcompletion('', 'color')) do
--     print(scheme)
-- end

local schemes = {
    'oasis-abyss',
    'oasis-cactus',
    'oasis-canyon',
    'oasis-desert',
    'oasis-dune',
    'oasis-lagoon',
    'oasis-midnight',
    'oasis-mirage',
    'oasis-night',
    'oasis-rose',
    'oasis-sol',
    'oasis-starlight',
    'oasis-twilight',
}

local mappings = function(prompt_bufnr, _)
    local actions = require("telescope.actions")
    actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selected = require("telescope.actions.state").get_selected_entry()[1]
        require('utils.scheme').use(selected)
        vim.fn.writefile({selected}, vim.fn.stdpath('config') .. '/scheme.txt')
    end)
    return true
end

vim.keymap.set('n', '<leader>sch', function()
    require("telescope.pickers").new({}, {
        prompt_title = "Select Project",
        finder = require("telescope.finders").new_table {
            results = schemes,
        },
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = mappings,
    }):find()
end)
