
-- gain access to the dap plugin and its functions
local dap = require("dap")

-- gain access to the dap ui plugin and its functions
local dapui = require("dapui")

-- Setup the dap ui with default configuration
dapui.setup()

-- setup an event listener for when the debugger is launched
dap.listeners.before.launch.dapui_config = function()
    -- when the debugger is launched open up the debug ui
    dapui.open()
end
