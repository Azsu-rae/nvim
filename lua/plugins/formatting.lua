return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      black = {
        -- Here you add extra args to pass to the Black command
        append_args = { "--line-length", "79" },
      },
    },
    formatters_by_ft = {
      python = {
        "ruff_fix", -- remove unused imports, fix lint issues
        "autopep8", -- fixes E305, W291, W293
        "black",    -- final canonical formatting
      },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
