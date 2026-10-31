return {
  {
    'mattn/emmet-vim',
    -- Las variables de emmet-vim deben existir antes de cargar el plugin.
    -- Se mantiene el líder por defecto (<C-y>): <C-e> ya cancela el menú de nvim-cmp.
    init = function()
      vim.g.user_emmet_mode = 'a'
    end
  }
}
