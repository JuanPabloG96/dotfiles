vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Error diagnostics
    vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff0000", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#ff0000", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = "#ff0000", bold = true })
    vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ff0000", bold = true })
  end,
})
