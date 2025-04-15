
-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',  -- Use the 'IncSearch' highlight group
            timeout = 200           -- Highlight duration in milliseconds
        })
    end
})

-- Automatically open nvim-tree
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        vim.schedule(function()
            local api = require("nvim-tree.api")
            -- Ensure nvim-tree opens only if no file is opened
            if vim.fn.argc() == 0 and vim.bo.filetype ~= "terminal" then
                -- Open nvim-tree and maximize it
                api.tree.open()
                vim.cmd('wincmd o') -- Make nvim-tree fullscreen
            end
        end)
    end
})

-- Prevents syntax overriding 
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.keymap.set("n", "<leader>pdf", function()
            local filename = vim.fn.expand("%:t:r") -- Get the filename without extension
            local fullpath = vim.fn.expand("%:p")   -- Get the full file path

            -- Open a terminal and run pdflatex
            vim.cmd("silent !pdflatex " .. fullpath .. " -silent")

            -- Wait for compilation (adjust sleep if needed)
            vim.defer_fn(function()
                -- Open the PDF file
                vim.cmd("silent !.\\" .. filename .. ".pdf -silent")
            end, 1000) -- Delay opening to let compilation finish
        end, { buffer = true })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c",
    callback = function()
        vim.keymap.set("n", "<leader>run", function()
            local filename = vim.fn.expand("%:t:r") -- Get filename without extension
            local fullpath = vim.fn.expand("%:p")   -- Get full path
            local output_binary = filename

            -- Detect OS and adjust commands
            local is_windows = vim.loop.os_uname().sysname:match("Windows")
            if is_windows then
                output_binary = filename .. ".exe"
            end

            -- Compile C file
            local compile_cmd = string.format("gcc \"%s\" -o \"%s\"", fullpath, output_binary)
            if not is_windows then
                compile_cmd = string.format("gcc \"%s\" -o \"%s\" >/dev/null 2>&1", fullpath, output_binary)
            end

            vim.cmd("silent !" .. compile_cmd)

            -- Check if compilation succeeded before running
            local file_exists = vim.fn.filereadable(output_binary) == 1
            if file_exists then
                vim.cmd("split | term " .. (is_windows and (".\\" .. output_binary) or ("./" .. output_binary)))
            else
                print("Compilation failed!\n" .. compile_cmd)
            end
        end, { buffer = true })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "r",
    callback = function()
        vim.keymap.set("n", "<leader>run", function()

            local fullpath = vim.fn.expand("%:p")   -- Get full path

            -- Compile C file
            local compile_cmd = string.format("rscript %s", fullpath)

            vim.cmd("split | term " .. compile_cmd)

            -- Check if compilation succeeded before running
        end, { buffer = true })
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "r",
    callback = function()
        vim.keymap.set("n", "<leader>src", function()

            local fullpath = vim.fn.expand("%:p")
            local compile_cmd = string.format('source("%s")\n', fullpath)

            local terminal_job_id = vim.fn.termopen("R")  -- Launch R and get its job ID

            vim.api.nvim_chan_send(terminal_job_id, compile_cmd)
            -- Find terminal buffer and send command
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
                local chan_id = vim.b[buf].terminal_job_id
                vim.api.nvim_chan_send(chan_id, compile_cmd)
                break
              end
            end
        end, { buffer = true })
    end
})
