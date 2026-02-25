return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      -- Configuración necesaria para que UFO funcione
      vim.o.foldcolumn = '1' -- Muestra una columna pequeña a la izquierda con los símbolos + o -
      vim.o.foldlevel = 0    -- Inicia con todo CERRADO (tu preferencia)
      vim.o.foldlevelstart = 0
      vim.o.foldenable = true

      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' } -- Usa Treesitter para decidir qué plegar
        end
      })

      -- Atajos simples para abrir/cerrar todo
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    end
  }
}
