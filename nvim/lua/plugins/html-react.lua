return {
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "windwp/nvim-autopairs",
    },
    config = function()
      require("nvim-ts-autotag").setup()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          javascript = { 'template_string' },
          javascriptreact = { 'template_string' },
          typescript = { 'template_string' },
          typescriptreact = { 'template_string' },
        }
      })
    end
  }
}
