return {
  {
    "windwp/nvim-ts-autotag",
    dependencies = {
      "windwp/nvim-autopairs"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }
}
