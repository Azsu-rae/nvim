
vim.api.nvim_set_hl(0, "@lsp.type.modifier.java", {link = "Keyword"})
vim.api.nvim_set_hl(0, "@lsp.type.namespace.java", {link = "@variable"})

-- get the project root
local dir = require("utils.dir")
local rootdir = dir.root()

-- eclipse.jdt.ls's .jar file launch command
local function getLaunchCmd()

    -- eclipse.jdt.ls path (installed using mason)
    local jar = 'org.eclipse.equinox.launcher_*.jar'
    local pathpattern = vim.fn.stdpath('data') ..'/mason/packages/jdtls/plugins/' .. jar

    local jarpath = vim.fn.glob(pathpattern)
    if vim.fn.empty(jarpath) == 1 then
        print("No eclipse.jdt.ls found! Install using mason (:MasonInstall jdtls)")
        return nil
    end

    -- OS-specific configuration files needed by the server
    local configfile = {
        Windows_NT="config_win",
        Linux="config_linux",
        Darwin="config_mac",
    }
    local configpath = vim.fn.stdpath('data') .. '/mason/packages/jdtls/' .. configfile[OS]

    -- for each project, jdtls creates a workspace where it stores it's data
    local projectname = vim.fn.fnamemodify(rootdir, ":p:h:t")
    local workspacefolder = vim.fn.stdpath('data') .. "/site/java/workspace/" .. projectname

    return {
        'java', -- Java 21 or higher. We'll use it to run the JDTLS .jar file

        -- these are just tooling flags so that JDTLS gets
        -- cut some slack and doesn't get kicked out by the JVM
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        '-jar', jarpath,
        '-configuration', configpath,
        "-data", workspacefolder,
    }
end

-- microsoft's java-debug installed using mason (run :MasonInstall java-debug-adapter)
local java_debug_dir = "/mason/packages/java-debug-adapter/extension/server"
local java_debug = "/com.microsoft.java.debug.plugin-*.jar"
local java_debug_path = vim.fn.glob(vim.fn.stdpath('data') .. java_debug_dir .. java_debug)
local debugger_present = vim.fn.empty(java_debug_path) == 0

local init_options = {}
if debugger_present then
    init_options = {
        bundles = {
            java_debug_path,
        }
    }
end

local on_attach = function(_, _)

    -- Debugger setup
    if debugger_present then
        require('jdtls').setup_dap {
            hotcodereplace = "auto",
            config_overrides = {
                cwd = rootdir,
            },
        }
        require('jdtls.dap').setup_dap_main_class_configs()
    end

    -- Setting the directory to the project root
    vim.cmd.cd(rootdir)
end

local cmd = getLaunchCmd()
if not cmd then
    return
end

require('jdtls').start_or_attach {
    cmd = cmd,
    root_dir = rootdir,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    init_options = init_options,
    on_attach = on_attach,
}
