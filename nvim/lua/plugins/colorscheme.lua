-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     style = "night",
--     transparent = true,
--
--     styles = {
--       comments = { italic = true },
--       keywords = { italic = true },
--       functions = {},
--       variables = {},
--
--       sidebars = "transparent",
--       floats = "transparent",
--     },
--   },
-- }
return {
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  opts = {
    style = 'auto',
    italics = true,
    terminal = vim.fn.has("gui_running") == 1,
    guicursor = true,
    rainbow_headings = false,
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
