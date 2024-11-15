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
        end
      })
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}

