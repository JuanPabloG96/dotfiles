-- return {
-- "folke/tokyonight.nvim",
-- lazy = false,
-- priority = 1000,
-- opts = {
-- style = "night",
-- transparent = true,
--
-- styles = {
-- comments = { italic = true },
-- keywords = { italic = true },
-- functions = {},
-- variables = {},
--
-- sidebars = "transparent",
-- floats = "transparent",
-- },
-- },
-- }
--
return {
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  opts = {
    style = 'auto',
    transparent = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},

      sidebars = "transparent",
      floats = "transparent"
    }
  }
}
