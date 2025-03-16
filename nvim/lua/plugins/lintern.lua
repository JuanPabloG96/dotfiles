return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      local function is_executable(cmd)
        return vim.fn.executable(cmd) == 1
      end
      lint.linters_by_ft = {
        javascript = function() return is_executable("eslint") and { "eslint" } or {} end,
        typescript = function() return is_executable("eslint") and { "eslint" } or {} end,
        javascriptreact = function() return is_executable("eslint") and { "eslint" } or {} end,
        typescriptreact = function() return is_executable("eslint") and { "eslint" } or {} end,
        python = function() return is_executable("flake8") and { "flake8" } or {} end,
        lua = function() return is_executable("luacheck") and { "luacheck" } or {} end,
        go = function() return is_executable("golangci-lint") and { "golangci-lint" } or {} end,
        rust = function() return is_executable("clippy") and { "clippy" } or {} end,
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      local function is_executable(cmd)
        return vim.fn.executable(cmd) == 1
      end
      conform.setup({
        formatters_by_ft = {
          javascript = function() return is_executable("prettier") and { "prettier" } or {} end,
          typescript = function() return is_executable("prettier") and { "prettier" } or {} end,
          javascriptreact = function() return is_executable("prettier") and { "prettier" } or {} end,
          typescriptreact = function() return is_executable("prettier") and { "prettier" } or {} end,
          python = function() return is_executable("black") and { "black", "isort" } or {} end,
          lua = function() return is_executable("stylua") and { "stylua" } or {} end,
          go = function() return is_executable("gofmt") and { "gofmt" } or {} end,
          rust = function() return is_executable("rustfmt") and { "rustfmt" } or {} end,
        },
      })
    end,
  }
}

