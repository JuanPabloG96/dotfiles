return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    priority = 999,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
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
          -- Si querés que el ancho quede realmente fijo en 30,
          -- poné adaptive_size = false. Con true, nvim-tree lo
          -- va a ajustar automáticamente al contenido.
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
          -- false = mostrar archivos ignorados por Git (I los alterna en vivo)
          git_ignored = false,
        },
        -- "git.ignore" fue renombrado a "filters.git_ignored"; ya no existe
        -- como opción separada, así que se elimina el bloque "git" acá.
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
