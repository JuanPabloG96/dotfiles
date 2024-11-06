return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
  end,
  config = function()
      require("nvim-treesitter.configs").setup({
          ensure_installed = { 
              "lua", "javascript", "html", "css", "python", "php", "java", 
              "scss", "go", "typescript", "tsx", "astro" 
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
      })
  end,
}
