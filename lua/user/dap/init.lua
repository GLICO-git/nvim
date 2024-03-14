local dap = require("dap")

-- ui
require("user.dap.ui")

-- debuggers
local lldb = require("user.dap.adapters.lldb")

dap.adapters.lldb = lldb.adapter

dap.configurations.c = lldb.config
dap.configurations.cpp = lldb.config
dap.configurations.rust = lldb.config
