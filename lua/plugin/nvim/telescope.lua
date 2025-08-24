
-- Telescope configuration
local telescope = require('telescope')

telescope.setup {
    defaults = {
        -- Basic Telescope settings
        mappings = {
            i = { -- Insert mode mappings
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-c>"] = "close",
            },
            n = { -- Normal mode mappings
                ["q"] = "close",
            },
        },
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            width = 0.87,
            height = 0.80,
        },
    },
    extensions = {
        -- Enable UI Select extension
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- Customize dropdown appearance if needed
            }
        },
        -- Enable fzf-native for faster sorting
        fzf = {
            fuzzy = true,                    -- Enable fuzzy matching
            override_generic_sorter = true,  -- Use fzf for generic sorting
            override_file_sorter = true,     -- Use fzf for file sorting
            case_mode = "smart_case",        -- Case sensitivity: smart_case, ignore_case, or respect_case
        },
    },
}

local openFile = function (prompt_bufnr)
    vim.cmd("NvimTreeClose")
    require('telescope.actions').select_default(prompt_bufnr)  -- still open the file
end

require('telescope.builtin').find_files {
    attach_mappings = function(_, map)
        map("i", "<CR>", openFile)
        return true
    end,
}

-- Load extensions
telescope.load_extension('ui-select')
telescope.load_extension('fzf')
