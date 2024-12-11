return {
  {
    'folke/trouble.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
      
      -- Set custom diagnostic signs
      local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " "
      }
      
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      -- Configure diagnostic colors
      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#FF0000", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#FF0000", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#FF0000", bold = true })
    end
  }
}
