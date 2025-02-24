
local actions = require 'telescope.actions'

require('telescope').setup {

    -- use ui-select dropdown as our ui
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    },

    -- set keymappings to navigate through items in the telescope io
    mappings = {
        i = {
             -- use <cltr> + k to go to the next option
            ["<C-k>"] = actions.cycle_history_next,
            -- use <cltr> + j to go to the previous option
            ["<C-j>"] = actions.cycle_history_prev,
            -- use <cltr> + n to go to the next preview
            ["<C-n>"] = actions.move_selection_next,
            -- use <cltr> + p to go to the previous preview
            ["<C-p>"] = actions.move_selection_previous,
        }
    },
    -- load the ui-select extension
    require("telescope").load_extension("ui-select")
}
