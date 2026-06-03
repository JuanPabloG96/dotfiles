local dap = require("dap")

local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = mason_path .. "adapter/codelldb",
        args = { "--port", "${port}" },
    },
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Path executable: ",
                vim.fn.getcwd() .. "/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

dap.configurations.c = dap.configurations.cpp
