return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.setup({
        win = {
          border = "single",
          position = "bottom",
        },
      })
      
      wk.register({
        f = { name = "Find", _ = "which_key_ignore" },
        x = { name = "Diagnostics", _ = "which_key_ignore" },
        e = { name = "Explorer", _ = "which_key_ignore" },
      }, { prefix = "<leader>" })
    end,
  }
}

