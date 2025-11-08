
local M = {}

local markers = {'.git', 'pom.xml', 'pubspec.yaml', 'pyproject.toml'}

-- looks for root markers and returns the directory of the first one it finds
M.module = function (path)

    if not path then
        path = vim.fn.expand("%:p:h")
    end

    local found = vim.fs.find(markers, {
        upward = true,
        path = path,
    })

    if #found == 0 then
        return nil
    end

    return vim.fn.fnamemodify(found[1], ":h")
end

M.root = function()

    local markerdir = M.module()
    if not markerdir then
        return vim.fn.getcwd()
    end

    -- looks one level above to ensure we are at the root not at a module
    local projectroot = M.module(vim.fn.fnamemodify(markerdir, ':h'))
    if projectroot then
        markerdir = projectroot
    end

    return markerdir
end

return M
