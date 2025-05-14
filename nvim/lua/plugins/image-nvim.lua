return {
  "3rd/image.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("image").setup({
      backend = "kitty", -- también soporta wezterm, sixel, etc.
      integrations = {
        markdown = {
          enabled = true, -- si quieres previsualizar imágenes embebidas en Markdown
        },
      },
    })
  end,
}
