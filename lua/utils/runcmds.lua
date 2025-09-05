
local function runfile(cmd)

    local fullpath = vim.fn.expand("%:p")
    if cmd.compiled then
        local compilation_output = vim.fn.fnamemodify(fullpath, ":t:r") .. cmd.output_ext
        local compile_cmd = string.format(cmd.template.compile, fullpath, compilation_output)
        local post_compilation = function (_, exit_code)
            if exit_code == 0 and vim.fn.filereadable(compilation_output) == 1 then
                vim.cmd("split | term " .. string.format(cmd.template.exec, compilation_output))
                if not cmd.save_output then
                    Autocmd {
                        events = {"BufWipeout", "BufUnload"},
                        opts = {
                            buffer = vim.api.nvim_get_current_buf(),
                            callback = function()
                                local outputdir = vim.fn.fnamemodify(fullpath, ':h')
                                os.remove(outputdir .. '/' .. compilation_output)
                            end,
                        },
                    }
                end
            else
                vim.notify("Compilation failed: " .. compile_cmd)
            end
        end
        vim.fn.jobstart(compile_cmd, {on_exit = post_compilation})
    else
        vim.cmd("split | term " .. string.format(cmd.template.exec, fullpath))
    end
end

local function runproject(rootdir)

    local runscript = rootdir .. "/run.sh"
    if OS:match("Windows") then
        runscript = "/c" .. string.sub(runscript, 3)
    end

    local s = ":split | term bash -c \"%s\""
    vim.cmd(string.format(s, runscript))
end

local function runningmethod(cmd)
    local rootdir = require('utils.dir').module()
    if rootdir then
        runproject(rootdir)
    else
        runfile(cmd)
    end
end

local function runcmd(cmd)
    Autocmd {
        events = "FileType",
        opts = {
            pattern = cmd.filetype,
            callback = function()
                SetKeymap("n", cmd.keysequence, function() runningmethod(cmd) end, {buffer = true})
            end
        }
    }
end

local windows = OS:match("Windows")
local extention = windows and ".exe" or ".out"

runcmd {
    filetype = "c",
    keysequence = "<leader>run",
    compiled = true,
    output_ext = extention,
    template = {
        compile = "gcc \"%s\" -o \"%s\"",
        exec = "./%s",
    }
}

runcmd {
    filetype = "cpp",
    keysequence = "<leader>run",
    compiled = true,
    output_ext = extention,
    template = {
        compile = "g++ \"%s\" -o \"%s\"",
        exec = "./%s",
    }
}

runcmd {
    filetype = "lua",
    keysequence = "<leader>run",
    compiled = false,
    template = {
        exec = "lua %s"
    }
}

runcmd {
    filetype = "java",
    keysequence = "<leader>run",
    compiled = false,
    template = {
        exec = "java %s"
    }
}
