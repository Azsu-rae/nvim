
local M = {}

local windows = vim.uv.os_uname().sysname:match("Windows")
local script_extension = windows and ".ps1" or ".sh"

M.binary_extention = windows and ".exe" or ".out"

M.runfile = function(cmd)

    local fullpath = vim.fn.expand("%:p")

    if not cmd.compiled then
        vim.cmd("split | term " .. string.format(cmd.template.exec, fullpath) .. "")
        return
    end

    local compilation_output = vim.fn.fnamemodify(fullpath, ":t:r") .. cmd.output_ext
    local compile_cmd = string.format(cmd.template.compile, fullpath, compilation_output)
    vim.cmd(compile_cmd)

    if vim.v.shell_error ~= 0 or vim.fn.filereadable(compilation_output) ~= 1 then
        return
    end

    vim.cmd("split | term " .. string.format(cmd.template.exec, compilation_output) .. "")

    if cmd.save_output then return end
    vim.api.nvim_create_autocmd({"BufWipeout", "BufUnload"}, {
        buffer = vim.api.nvim_get_current_buf(),
        callback = function()
            local outputdir = vim.fn.fnamemodify(fullpath, ':h')
            os.remove(outputdir .. '/' .. compilation_output)
        end,
    })
end

local function runproject(rootdir)
    local script = rootdir .. "/run" .. script_extension
    local s = ":split | term %s"
    vim.notify(string.format(s, script))
    vim.cmd(string.format(s, script))
end

M.run = function(cmd)
    local dir = require('utils.dir').module()
    if dir then
        runproject(dir)
    else
        M.runfile(cmd)
    end
end

return M
