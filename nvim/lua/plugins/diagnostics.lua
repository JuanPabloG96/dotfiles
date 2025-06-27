return {
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()

      vim.diagnostic.config({
        signs = {
          active = true,
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN]  = "▲",
            [vim.diagnostic.severity.INFO]  = "⚑",
            [vim.diagnostic.severity.HINT]  = "⚑",
          },
        },
      })

      vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#FF0000", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#FFA500", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#00BFFF", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#00FF00", bold = true })

      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#FF0000", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#FFA500", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#00BFFF", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#00FF00", bold = true })

      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF0000", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#FFA500", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#00BFFF", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#00FF00", bold = true })
    end
  }
}
