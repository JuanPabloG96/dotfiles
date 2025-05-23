return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local ok, catppuccin = pcall(require, "catppuccin")
      if not ok then
        vim.cmd("colorscheme default") -- Usa un esquema por defecto si catppuccin no está disponible
        return
      end

      catppuccin.setup({
        flavour = "mocha",
        transparent_background = true,
        term_colors = true,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "bold" },
          functions = { "bold" },
          keywords = { "bold" },
          strings = { "italic" },
          variables = { "bold" },
          numbers = { "bold" },
        },
        on_highlights = function(hl, c)
          hl.Normal = { bg = "NONE" }
          hl.NormalFloat = { bg = "NONE" }
          hl.CursorLine = { bg = "NONE" }
          hl.ColorColumn = { bg = "NONE" }
          hl.CursorLineNr = { fg = "#ffffff", bg = "NONE" }
          hl.DiagnosticError = { fg = "#ff0000", bold = true }
          hl.DiagnosticVirtualTextError = { fg = "#ff0000", bold = true }
          hl.DiagnosticFloatingError = { fg = "#ff0000", bold = true }
          hl.DiagnosticSignError = { fg = "#ff0000", bold = true }
        end
      })
      vim.cmd("colorscheme catppuccin")
    end,
  }
}
