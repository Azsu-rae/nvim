return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      "html",
      "java",
      "javascript",
      "lua",
      "python",
      "sh",
      "sql",
      "typst",
    },
  },
}
