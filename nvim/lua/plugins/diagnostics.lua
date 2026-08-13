return {
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {}, -- Utiliza las opciones por defecto de Trouble
    config = function(_, opts)
      require("trouble").setup(opts)

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN]  = "▲",
            [vim.diagnostic.severity.INFO]  = "⚑",
            [vim.diagnostic.severity.HINT]  = "⚑"
          }
        }
      })

      -- Resaltado de diagnósticos
      local highlights = {
        DiagnosticSignError = { fg = "#FF0000", bold = true },
        DiagnosticSignWarn  = { fg = "#FFA500", bold = true },
        DiagnosticSignInfo  = { fg = "#00BFFF", bold = true },
        DiagnosticSignHint  = { fg = "#00FF00", bold = true }
      }

      for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
      end
    end
  }
}
