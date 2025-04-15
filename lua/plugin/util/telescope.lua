local actions = require 'telescope.actions'

require('telescope').setup {

    defaults = {
        -- set keymappings to navigate through items in the telescope io
        mappings = {
            i = {
                -- CHECKOUT DEFAULT MAPPINGS IN THE GITHUB PAGE
--                ["<C-j>"] = actions.move_selection_next,  -- Move to the next item
--                ["<C-k>"] = actions.move_selection_previous, -- Move to the previous item
            },
        },
    },

    -- use ui-select dropdown as our ui
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        },
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    },
}

-- load the ui-select extension
require("telescope").load_extension("ui-select")

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

