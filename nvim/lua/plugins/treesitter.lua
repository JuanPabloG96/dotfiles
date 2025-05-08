return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
      local ok, treesitter = pcall(require, "nvim-treesitter.configs")
      if not ok then return end
      treesitter.setup({
        ensure_installed = {
          "lua", "javascript", "html", "css", "python", "php", "java",
          "scss", "go", "typescript", "tsx", "astro", "json", "markdown",
          "bash", "regex", "vim", "c", "cpp", "rust", "yaml", "toml"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
}

