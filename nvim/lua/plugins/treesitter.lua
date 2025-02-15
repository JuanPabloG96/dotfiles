return {
    {
      "nvim-treesitter/nvim-treesitter",
      dependencies = {
        "windwp/nvim-ts-autotag"
      },
      build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
      end,
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { 
            "lua", "javascript", "html", "css", "python", "php", "java", 
            "scss", "go", "typescript", "tsx", "astro", "json", "markdown",
            "bash", "regex", "vim"
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
        require('nvim-ts-autotag').setup()
      end,
    }
  }
