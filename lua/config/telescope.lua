
-- is this necessary?
local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      "%.git/.*",
      "%.jar",
      "%.svg",
    },
    layout_strategy = "horizontal",
    layout_config = { horizontal = { width = 0.95 } },
    prompt_prefix = "🔍 ",
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    path_display = { "absolute" },
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<C-k>"] = actions.move_selection_previous, -- C-k goes down
        ["<C-j>"] = actions.move_selection_next,     -- C-j goes up
        ["<C-n>"] = actions.preview_scrolling_down,
        ["<C-p>"] = actions.preview_scrolling_up,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = false,
      theme = "ivy",
      previewer = true,
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob", "!.git/*",
      }
    },
    buffers = {
      theme = "ivy",
      sort_lastused = true
    },
    live_grep = { theme = "ivy" },
    help_tags = { theme = "ivy" },
  },
})

require("telescope").load_extension("ui-select")

local function keymap(mode, map) vim.keymap.set(mode, map[1], map[2], { desc = map.desc, buffer = map.buffer})end

local function n_map(map) keymap("n", map) end
local function i_map(map) keymap("i", map) end

local builtin = require("telescope.builtin")
n_map { "<leader>f",  builtin.find_files, desc = "Find Files (normal mode)" }
n_map { "<leader>r",  builtin.resume,     desc = "[R]esume previous search" }
n_map { "<leader>gr", builtin.live_grep,  desc = "Live Grep" }
n_map { "<leader>lb", builtin.buffers,    desc = "[L]ist Buffers" }

i_map { "<C-f>", builtin.find_files, desc = "Find Files (insert mode)" }

vim.api.nvim_create_autocmd('LspAttach', {
  pattern = '*',
  callback = function(ev)
    n_map {"grr", builtin.lsp_references,       desc = "Telescope wrapper on vim.lsp.buf.references()"     , buffer = ev.buf}
    n_map {"gri", builtin.lsp_implementations,  desc = "Telescope wrapper on vim.lsp.buf.implementation()" , buffer = ev.buf}
    n_map {"grt", builtin.lsp_definitions,      desc = "Telescope wrapper on vim.lsp.buf.type_definition()", buffer = ev.buf}
  end
})

-- vim.defer_fn(function()
--   require("highlights").set_transparent_bg {
--     "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal",
--     "TelescopePromptBorder", "TelescopeResultsNormal", "TelescopePreviewNormal",
--     "TelescopeSelection", "TelescopeSelectionCaret"
--   }
-- end, 100)
