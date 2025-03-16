return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    priority = 999,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local nvim_tree = require("nvim-tree")

      nvim_tree.setup({
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          api.config.mappings.default_on_attach(bufnr)
        end,
        sort_by = "case_sensitive",
        view = {
          width = 30,
          side = "left",
          adaptive_size = true,
          preserve_window_proportions = true,
        },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
          custom = {},
          git_ignored = false, -- Mostrar archivos ignorados por Git
        },
        git = {
          ignore = false, -- Asegura que se muestren los archivos ignorados por Git
        },
        actions = {
          open_file = {
            quit_on_open = true,
            resize_window = true,
          },
          file_popup = {
            open_win_config = {
              col = 1,
              row = 1,
              relative = "cursor",
              border = "shadow",
              style = "minimal",
            },
          },
        },
        filesystem_watchers = {
          enable = true,
        },
      })
      -- Keymaps
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true, desc = "Toggle NvimTree" })
    end,
  }
}
