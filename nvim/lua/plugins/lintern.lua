return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      -- JS/TS no van aquí: el LSP de eslint ya publica esos diagnósticos.
      lint.linters_by_ft = {
        python = { "flake8" },
        lua = { "luacheck" },
        go = { "golangcilint" },
        rust = { "clippy" },
      }

      local luacheck = lint.linters.luacheck
      luacheck.args = vim.list_extend({ "--globals", "vim" }, luacheck.args)

      vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function()
          -- ignore_errors: un linter sin instalar no debe avisar en cada buffer.
          lint.try_lint(nil, { ignore_errors = true })
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          python = { "black", "isort" },
          lua = { "stylua" },
          go = { "gofmt" },
          rust = { "rustfmt" },
        },
      })
    end,
  },
}
