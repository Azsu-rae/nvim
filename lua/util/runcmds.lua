
local function runfile(cmd)

    local fullpath = Vimscript.expand("%:p")   -- Get full path

    if cmd.compiled then

        local compilation_output = FilepathTransform(fullpath, ":t:r") .. cmd.output_ext
        local compile_cmd = string.format(cmd.template.compile, fullpath, compilation_output)

        local opts = {
            on_exit = function (_, exit_code)
                if exit_code == 0 and Vimscript.filereadable(compilation_output) == 1 then
                    vim.cmd("split | term " .. string.format(cmd.template.exec, compilation_output))

                    if not cmd.save_output then
                        Autocmd {
                            events = {"BufWipeout", "BufUnload"},
                            opts = {
                                buffer = vim.api.nvim_get_current_buf(),  -- only this buffer
                                callback = function()
                                    os.remove(FilepathTransform(fullpath, ":h") .. "/" .. compilation_output)
                                end,
                            },
                        }
                    end
                else
                    print("Compilation failed!\n" .. compile_cmd)
                end
            end,
        }

        Vimscript.jobstart(compile_cmd, opts)
    else
        vim.cmd("split | term " .. string.format(cmd.template.exec, fullpath))
    end
end

local function runcmd(cmd)
    Autocmd {
        events = "FileType",
        opts = {
            pattern = cmd.filetype,
            callback = function()

                local run = function()
                    local dir = require("util.dir")
                    if dir.inProject() then
                        vim.cmd("split | term " .. dir.project.module() .. "/run.sh")
                    else
                        runfile(cmd)
                    end
                end

                SetKeymap("n", cmd.keysequence, run, {buffer=true})
            end
        }
    }
end

local windows = OS:match("Windows")
local run = windows and "%s" or "./%s"
local extention = windows and ".exe" or ".out"

runcmd {
    filetype = "c",
    keysequence = "<leader>run",
    compiled = true,
    output_ext = extention,
    template = {
        compile = "gcc \"%s\" -o \"%s\"",
        exec = run,
    },
}

runcmd {
    filetype = "cpp",
    keysequence = "<leader>run",
    compiled = true,
    output_ext = extention,
    template = {
        compile = "g++ \"%s\" -o \"%s\"",
        exec = run,
    },
}

runcmd {
    filetype = "tex",
    keysequence = "<leader>pdf",
    compiled = true,
    save_output = true,
    output_ext = ".pdf",
    template = {
        compile = "pdflatex %s",
        exec = "xdg-open %s",
    },
}

runcmd {
    filetype = "java",
    keysequence = "<leader>run",
    compiled = false,
    template = {
        exec = "java %s"
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
