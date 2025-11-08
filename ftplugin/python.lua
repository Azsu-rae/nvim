
local runcmds = require('utils.runcmds')
local cmd = {
    compiled = false,
    template = {
        exec = "py %s"
    }
}

vim.keymap.set("n", "<leader>run", function() runcmds.run(cmd) end, {
    buffer=true
})

vim.keymap.set("n", "<leader>rf", function() runcmds.runfile(cmd) end, {
    buffer=true
})
