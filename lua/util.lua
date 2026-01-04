
local M = {}

M.os = {}

M.os.in_windows = vim.uv.os_uname().sysname == "Windows_NT"
M.os.vimrc = M.in_windows and "~/_vimrc" or "~/.vimrc"

if M.os.in_windows then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
end

function M.SyncWindowsTerminalBackground()

  -- read the .json config file as a string
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

return M
