return {
  { -- LSPs to install other than the ones in lsp/ are: djlint
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
}
