return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          hl.Normal = { bg = "NONE" }
          hl.NormalFloat = { bg = "NONE" }
          hl.CursorLine = { bg = "NONE" }
          hl.ColorColumn = { bg = "NONE" }  -- Nota: ColorColumn con C mayúscula
          hl.CursorLineNr = { fg = "#ffffff", bg = "NONE" }
          hl.DiagnosticError = { fg = "#ff0000", bold = true }
          hl.DiagnosticVirtualTextError = { fg = "#ff0000", bold = true }
          hl.DiagnosticFloatingError = { fg = "#ff0000", bold = true }
          hl.DiagnosticSignError = { fg = "#ff0000", bold = true }
        end
      })
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_style = 'default'
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_transparent_background = 1
    end,
  },
}

