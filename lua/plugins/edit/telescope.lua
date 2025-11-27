
local M = {}

local opts = {
    defaults = {
        mappings = {
            i = {
                ['<C-j>']="move_selection_next",
                ['<C-k>']="move_selection_previous",
                ['<esc>']="close",
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

M.setup = function()
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
end

M.startpicker = {}
M.startpicker.display = function()

    local projects = vim.fn.glob(PROJECTS_DIR .. "/*", true, true)  -- list of dirs in projects_dir
    local projectpath = {}
    local names = {}

    names[1] = 'nvim'
    projectpath['nvim'] = vim.fn.stdpath('config')
    for i, path in ipairs(projects) do
        names[i+1] = vim.fn.fnamemodify(path, ":t")
        projectpath[names[i+1]] = path
    end

    local mappings = function(prompt_bufnr, _)

        local actions = require("telescope.actions")
        actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            vim.cmd.cd(projectpath[require("telescope.actions.state").get_selected_entry()[1]])
            require("nvim-tree.api").tree.open()
            vim.cmd.wincmd('o') -- Make nvim-tree fullscreen
        end)

        return true
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Select Project",
        finder = require("telescope.finders").new_table {
            results = names,
        },
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = mappings,
    }):find()
end

return M
