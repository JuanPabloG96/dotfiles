return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "bash",
          "c",
          "cpp",
          "python",
          "javascript",
          "typescript",
          "html",
          "css",
          "json"
        },
        highlight = { enable = true },
        indent = { enable = true }
      })

      -- Asegura que .tpp se reconozca como C++ (no es un filetype nativo de Vim)
      vim.filetype.add({
        extension = {
          tpp = "cpp"
        }
      })
    end
  }
}
