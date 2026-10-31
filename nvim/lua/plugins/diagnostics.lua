return {
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
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

      local function apply_highlights()
        for group, hl in pairs(highlights) do
          vim.api.nvim_set_hl(0, group, hl)
        end
      end

      apply_highlights()

      -- Cada :colorscheme borra los resaltados, así que hay que reaplicarlos.
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("diagnostic-highlights", { clear = true }),
        callback = apply_highlights,
      })
    end
  }
}
