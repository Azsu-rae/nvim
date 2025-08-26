
-- get the project root
local dir = require("util.dir")

local root_dir
if dir.inProject() then
    root_dir = dir.project.root()
else
    root_dir = Vimscript.getcwd();
end

-- eclipse.jdt.ls's .jar file launch command
local function getLaunchCmd()

    -- OS-specific configuration files needed by the server
    local eclipse_jdt_ls_config = {
        Windows_NT="config_win",
        Linux="config_linux",
        Darwin="config_mac",
    }

    local eclipse_jdt_ls_config_path = Cashe.datapath .. '/mason/packages/jdtls/' .. eclipse_jdt_ls_config[OS]

    -- for each project, jdtls creates a workspace where it stores it's data
    local workspace_folder = Cashe.datapath .. "/site/java/workspace/" .. FilepathTransform(root_dir, ":p:h:t")

    -- eclipse.jdt.ls path (installed using mason)
    local pattern = Cashe.datapath ..'/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'
    local eclipse_jdt_ls_jar_path = MatchPattern(pattern)

    if Vimscript.empty(eclipse_jdt_ls_jar_path) == 1 then
        print("No eclipse.jdt.ls found! Install using mason (:MasonInstall jdtls)")
        return nil
    end

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

        '-jar', eclipse_jdt_ls_jar_path,
        '-configuration', eclipse_jdt_ls_config_path,
        "-data", workspace_folder,
    }
end


-- microsoft's java-debug cloned and build from github
local java_debug_dir = "/java-debug/com.microsoft.java.debug.plugin/target/"
local java_debug = "com.microsoft.java.debug.plugin-*.jar"
local java_debug_path = MatchPattern(Cashe.datapath .. java_debug_dir .. java_debug)

local debugger_present = (Vimscript.empty(java_debug_path) == 0)

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
                cwd = root_dir,
            },
        }
        require('jdtls.dap').setup_dap_main_class_configs()
    end

    -- Setting the directory to the project root
    vim.cmd.cd(root_dir)
end

local cmd = getLaunchCmd()
local installed = true
if cmd == nil then
    installed = false
end

local config = {
    cmd = cmd,
    root_dir = root_dir,
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    init_options = init_options,
    on_attach = on_attach,
}

return {
    config=config,
    installed=installed,
}
