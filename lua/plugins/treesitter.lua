return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  setup = function()
    require("nvim-treesitter").install({"lua", "python"})
  end,
}
