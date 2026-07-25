local ok, actions = pcall(require, "telescope.actions")
local mappings_i = nil
if ok then
  mappings_i = {
    ["<Esc>"] = actions.close,
    ["<C-k>"] = actions.move_selection_previous, -- C-k goes down
    ["<C-j>"] = actions.move_selection_next,     -- C-j goes up
  }
end

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",         -- load when :Telescope is run
  version = "0.1.x",         -- use a stable tag
  dependencies = {
    "nvim-lua/plenary.nvim", -- required helper library
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    vim.defer_fn(function()
      require("highlights").set_transparent_bg({ "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal",
        "TelescopePromptBorder", "TelescopeResultsNormal", "TelescopePreviewNormal", "TelescopeSelection",
        "TelescopeSelectionCaret" })
    end, 100)
  end,
  keys = {
    { "<leader>f",  "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>gr", "<cmd>Telescope live_grep<CR>",  desc = "Live Grep" },
    { "<leader>lb", "<cmd>Telescope buffers<CR>",    desc = "[L]ist Buffers" },
    { "<leader>lh", "<cmd>Telescope help_tags<CR>",  desc = "[L]ist Help Tags" },
    { "<leader>lr", "<cmd>Telescope resume<CR>",     desc = "[L]ist Help Tags" },
  },
  opts = {
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
      path_display = { "smart" },
      mappings = {
        i = mappings_i,
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
  },
}
