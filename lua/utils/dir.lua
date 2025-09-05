
local M = {}

local markers = {'.git', 'pom.xml'}

local function getMarkerDir(path)

    if not path then
        path = vim.fn.expand("%:p:h")
    end

    local found = vim.fs.find(markers, {
        upward = true,
        path =path,
    })

    if #found == 0 then
        return nil
    end

    return vim.fn.fnamemodify(found[1], ":h")
end

M.root = function()

    local markerdir = getMarkerDir()
    if markerdir then
        local projectroot = getMarkerDir(vim.fn.fnamemodify(markerdir, ':h'))
        if projectroot then
            markerdir = projectroot
        end
    else
        markerdir = vim.fn.getcwd()
    end

    return markerdir
end

M.module = getMarkerDir

return M
