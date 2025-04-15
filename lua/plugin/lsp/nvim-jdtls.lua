local jdtls = require('jdtls')
local mason_registry = require('mason-registry')

-- Detect OS for jdtls config
local system = (vim.loop.os_uname().sysname == "Windows_NT") and "win" or "linux"

-- Get paths from Mason
local function get_jdtls_paths()
    local jdtls_pkg = mason_registry.get_package("jdtls")
    local jdtls_path = jdtls_pkg:get_install_path()
    local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
    local config_path = jdtls_path .. "/config_" .. system
    local lombok_path = jdtls_path .. "/lombok.jar"
    return launcher, config_path, lombok_path
end

-- Get workspace directory
local function get_workspace()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    return vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name
end

-- LSP capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup keymaps
local function java_keymaps()
    local keymap = vim.keymap.set
    keymap('n', '<leader>Jo', jdtls.organize_imports, { desc = "[J]ava [O]rganize Imports" })
    keymap('n', '<leader>Jv', jdtls.extract_variable, { desc = "[J]ava Extract [V]ariable" })
    keymap('v', '<leader>Jv', function() jdtls.extract_variable(true) end, { desc = "[J]ava Extract [V]ariable" })
    keymap('n', '<leader>Jc', jdtls.extract_constant, { desc = "[J]ava Extract [C]onstant" })
    keymap('v', '<leader>Jc', function() jdtls.extract_constant(true) end, { desc = "[J]ava Extract [C]onstant" })
    keymap('n', '<leader>Jt', jdtls.test_nearest_method, { desc = "[J]ava [T]est Method" })
    keymap('n', '<leader>JT', jdtls.test_class, { desc = "[J]ava [T]est Class" })
    keymap('n', '<leader>Ju', function() vim.cmd("JdtUpdateConfig") end, { desc = "[J]ava [U]pdate Config" })
end

-- Setup JDTLS
local function setup_jdtls()
    local launcher, config_path, lombok_path = get_jdtls_paths()
    local workspace_dir = get_workspace()

    local config = {
        cmd = {
            'java', '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true', '-Dlog.level=ALL', '-Xmx1g',
            '--add-modules=ALL-SYSTEM', '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
            '-javaagent:' .. lombok_path,
            '-jar', launcher, '-configuration', config_path, '-data', workspace_dir
        },
        root_dir = jdtls.setup.find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),
        capabilities = capabilities,
        on_attach = function()
            java_keymaps()
            require('jdtls.dap').setup_dap()
            vim.lsp.codelens.refresh()
        end,
    }

    jdtls.start_or_attach(config)
end

-- Run JDTLS when opening a Java file
vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = setup_jdtls,
})

