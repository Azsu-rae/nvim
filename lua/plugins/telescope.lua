return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { horizontal = { width = 0.95 } },
        prompt_prefix = "🔍 ",
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        path_display = { "smart" },
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-k>"] = actions.move_selection_previous, -- C-k goes down
            ["<C-j>"] = actions.move_selection_next,     -- C-j goes up
          },
        },
      },
      pickers = {
        find_files = {
          hidden = false,
          no_ignore = false,
          theme = "ivy",
          previewer = false,
        },
        buffers = {
          theme = "ivy",
          sort_lastused = true
        },
        live_grep = { theme = "ivy" },
        help_tags = { theme = "ivy" },
      },
    })
  end,

  cmd = "Telescope",         -- load when :Telescope is run
  version = "0.1.x",         -- use a stable tag
  dependencies = {
    "nvim-lua/plenary.nvim", -- required helper library
  },
  keys = {
    { "<leader>f",  "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>wg", "<cmd>Telescope live_grep<CR>",  desc = "Live Grep" },
    { "<leader>wb", "<cmd>Telescope buffers<CR>",    desc = "Buffers" },
    { "<leader>wh", "<cmd>Telescope help_tags<CR>",  desc = "Help Tags" },
  },
}
