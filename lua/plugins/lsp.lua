return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
      vim.lsp.enable({"pylsp", "lua_ls", "tinymist", "clangd"})
      vim.diagnostic.config {
        virtual_text = true
      }
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
}
