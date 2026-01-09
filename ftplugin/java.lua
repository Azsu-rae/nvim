
vim.treesitter.start()

vim.keymap.set("i", "<BS>", function()
  local col = vim.fn.col(".") - 1
  if col <= 0 then
    return "<BS>"
  end

  local line = vim.fn.getline(".")
  local before_cursor = line:sub(1, col)

  -- If only whitespace before cursor → delete all of it
  if before_cursor:match("^%s+$") then
    return "<C-u>"
  end

  return "<BS>"
end, { expr = true, noremap = true })

vim.api.nvim_set_hl(0, "@lsp.type.modifier.java", {})
vim.api.nvim_set_hl(0, "@lsp.type.namespace.java", {})

-- See `:help vim.lsp.start` for an overview of the supported `config` options.
local config = {
  name = "jdtls",

  -- `cmd` defines the executable to launch eclipse.jdt.ls.
  -- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
  --
  -- As alternative you could also avoid the `jdtls` wrapper and launch
  -- eclipse.jdt.ls via the `java` executable
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {"jdtls"},


  -- `root_dir` must point to the root of your project.
  -- See `:help vim.fs.root`
  root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw', 'pom.xml'}),


  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
    }
  },


  -- This sets the `initializationOptions` sent to the language server
  -- If you plan on using additional eclipse.jdt.ls plugins like java-debug
  -- you'll need to set the `bundles`
  --
  -- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on any eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
require('jdtls').start_or_attach(config)
