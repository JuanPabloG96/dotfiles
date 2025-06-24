return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-g>",
        clear_suggestion = "<C-j>"
      },
      color = {
        suggestion_color = "#3f88c5",
        cterm = 244
      },
      disable_inline_completion = false,
      disable_keymaps = false,
    })
  end
}
