return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      }
    },
    config = function()
      local ok, telescope = pcall(require, 'telescope')
      if not ok then
        return
      end

      local builtin = require('telescope.builtin')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
          },
          path_display = { "truncate" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<Esc>"] = actions.close,
            }
          },
        },
        pickers = {
          find_files = {
            hidden = true, -- Mostrar archivos ocultos
            follow = true, -- Seguir enlaces simbólicos
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- Habilita búsqueda difusa
            override_generic_sorter = true, -- Sobrescribe el sorter genérico
            override_file_sorter = true,    -- Sobrescribe el sorter de archivos
            case_mode = "smart_case",       -- Ignora mayúsculas si no hay mayúsculas en la búsqueda
          },
        }
      })

      telescope.load_extension('fzf')
      -- Keymaps
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find text' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find recent' })
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find symbols' })
    end
  }
}

