
local colorscheme = {}
colorscheme.link = "https://github.com/webhooked/kanso.nvim"
colorscheme.to_set = "kanso"

vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  colorscheme.link,
})

require("nvim-treesitter").install({"lua", "python"})
require("mason").setup()

require("mini.statusline").setup()
vim.opt.showmode = false

vim.cmd.colorscheme(colorscheme.to_set)
if in_windows then
  -- Set terminal background color to be the same as neovim's

  -- read the .json file as a string
  local json_path = vim.fn.expand("~") .. "\\AppData\\Local\\Packages\\Microsoft.WindowsTerminal_8wekyb3d8bbwe\\LocalState\\settings.json"
  local json_lines = vim.fn.readfile(json_path)
  local json_str = table.concat(json_lines, "\n")

  -- get the neovim background color
  local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  local bg = string.format("#%06x", normal.bg)

  -- read the .json config file
  local config = vim.json.decode(json_str)

  -- get the colorscheme used by the terminal
  local terminal_colorscheme = config.profiles.defaults.colorScheme

  -- look for it and replace its background color by neovim's
  for _, scheme in ipairs(config.schemes) do
      if scheme.name == terminal_colorscheme then
        scheme.background = bg
      end
  end

  -- save changes
  local new_json = vim.json.encode(config)
  vim.fn.writefile({new_json}, json_path)
end
