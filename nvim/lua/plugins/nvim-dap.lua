return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
  },
  keys = {
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Breakpoint Condition",
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Run/Continue",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Terminate",
    },
    {
      "<leader>dr",
      function()
        require("dap").repl.toggle()
      end,
      desc = "Toggle REPL",
    },
  },
  config = function()
    local dap = require("dap")

    -- La configuración de dapui.setup() y sus listeners de
    -- open/close en event_initialized/terminated/exited ya viven
    -- en nvim-dap-ui.lua; no se duplican acá para evitar que este
    -- archivo pise esa configuración cuando cargue después.
    -- require("nvim-dap-virtual-text").setup() tampoco hace falta:
    -- ya se llama solo por declarar `opts = {}` en la dependencia.

    -- ICONOS
    vim.fn.sign_define("DapBreakpoint", {
      text = "🔴",
      texthl = "DiagnosticError",
    })
    vim.fn.sign_define("DapStopped", {
      text = "➡️",
      texthl = "DiagnosticInfo",
      linehl = "Visual",
    })

    -- CODELLDB
    local mason_path =
        vim.fn.stdpath("data")
        .. "/mason/packages/codelldb/extension/"
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = mason_path .. "adapter/codelldb",
        args = { "--port", "${port}" },
      },
    }

    -- C++
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input(
            "Path to executable: ",
            vim.fn.getcwd() .. "/",
            "file"
          )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp
  end,
}
