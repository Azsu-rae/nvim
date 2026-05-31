return {
  "stevearc/conform.nvim",
  opts = {
    format_after_save = function(bufnr)
      if vim.bo[bufnr].filetype == "htmldjango" then
        return nil
      end
      return {
        lsp_fallback = true,
        async = true,
      }
    end,
  },
}
