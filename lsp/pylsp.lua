---@type vim.lsp.Config
return {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },

  before_init = function(_, config)
    local root = config.root_dir
    local candidates = {
      root .. "/.venv/bin/python",
      root .. "/venv/bin/python",
      root .. "/env/bin/python",
    }

    for _, path in ipairs(candidates) do
      if vim.loop.fs_stat(path) then
        vim.notify("We found the Python venv at: " .. path)
        config.settings = config.settings or {}
        config.settings.pylsp = config.settings.pylsp or {}
        config.settings.pylsp.plugins = config.settings.pylsp.plugins or {}

        config.settings.pylsp.plugins.jedi = config.settings.pylsp.plugins.jedi or {}
        config.settings.pylsp.plugins.jedi.environment = path

        -- optional: disable pylsp-mypy to avoid false import errors
        config.settings.pylsp.plugins.pylsp_mypy = { enabled = false }
        break
      end
    end
  end,
}
