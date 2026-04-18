return {
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- Optional, for better UI (select/input)
    },
    config = function()
      require("flutter-tools").setup {
        ui = {
          border = "rounded",
        },
        widget_guides = { enabled = true },
        lsp = {
          color = { -- Enables color preview for hex codes
            enabled = true,
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
          },
        },
        debugger = {
          enabled = true,
          run_via_dap = true,
        },
      }
    end,
  },
}
