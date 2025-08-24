
local M = {}

M.display = function()

    local projects = MatchPattern(PROJECTS_DIR .. "/*", 1, 1)  -- list of dirs in projects_dir
    local projectpath = {}
    local names = {}
    for i, path in ipairs(projects) do
        names[i] = FilepathTransform(path, ":t")
        projectpath[names[i]] = path
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Select Project",
        finder = require("telescope.finders").new_table {
            results = names,
        },
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, _)

            local actions = require("telescope.actions")
            local behavior = function ()

                actions.close(prompt_bufnr)
                vim.cmd.cd(projectpath[require("telescope.actions.state").get_selected_entry()[1]])

                -- Open nvim-tree and maximize it
                require("nvim-tree.api").tree.open()
                vim.cmd.wincmd('o') -- Make nvim-tree fullscreen
            end

            actions.select_default:replace(behavior)

            return true
        end,
    }):find()
end

return M
