return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",         -- load when :Telescope is run
  version = "0.1.x",         -- use a stable tag
  dependencies = {
    "nvim-lua/plenary.nvim", -- required helper library
  },
  keys = {
    { "<leader>f",  "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>gr", "<cmd>Telescope live_grep<CR>",  desc = "Live Grep" },
    { "<leader>lb", "<cmd>Telescope buffers<CR>",    desc = "[L]ist Buffers" },
    { "<leader>lh", "<cmd>Telescope help_tags<CR>",  desc = "[L]ist Help Tags" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "node_modules",
        ".git/",
        "dist/",
        "build/",
      },
      layout_strategy = "horizontal",
      layout_config = { horizontal = { width = 0.95 } },
      prompt_prefix = "🔍 ",
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      path_display = { "smart" },
      mappings = {
        i = {
          ["<Esc>"] = require("telescope.actions").close,
          ["<C-k>"] = require("telescope.actions").move_selection_previous, -- C-k goes down
          ["<C-j>"] = require("telescope.actions").move_selection_next,     -- C-j goes up
        },
      },
    },
    pickers = {
      find_files = {
        hidden = true,
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
  },
}
