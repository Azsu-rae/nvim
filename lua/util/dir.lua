
local M = {}

local markers = {'gradlew', '.git', 'mvnw', 'pom.xml'}

local function isSubstringPresent(lines, target)

    for _, line in ipairs(lines) do
        if line:match(target) then
            return true
        end
    end

    return false
end

local function markerExists(dir)
    return Vimscript.exists(dir .. "/pom.xml")
end

local function isMultiModule(dir)

    if markerExists(dir) then
        return isSubstringPresent(Vimscript.readfile(dir .. "/pom.xml"), "modules")
    end

    return false
end

local function parentdir(dir)
    return FilepathTransform(dir, ":h")
end

local getMarkerDir = function ()

    local found = Filesystem.find(markers, {
        upward=true,
        path=Vimscript.expand("%:p:h"),
    })

    if #found == 0 then
        return nil
    end

    return FilepathTransform(found[1], ":h")
end

local root = function()

    local markerdir = getMarkerDir()
    if markerdir ~= nil and not isMultiModule(markerdir) then
        if isMultiModule(parentdir(markerdir)) then
            markerdir = parentdir(markerdir)
        end
    elseif markerdir == nil then
        markerdir = Vimscript.getcwd()
    end

    return markerdir
end

local module = function()
    return getMarkerDir()
end

M.inProject = function ()
    return getMarkerDir()
end

M.project = {
    root=root,
    module=module,
}

return M
