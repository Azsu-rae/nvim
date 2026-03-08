return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter").install({
      "lua",
      "python",
      "javascript",
      "typescript",
      "c",
      "cpp",
      "java",
      "html",
      "css",
      "bash",
      "json",
      "scala",
    })
  end
}
