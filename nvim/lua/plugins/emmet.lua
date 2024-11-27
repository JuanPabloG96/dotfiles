return {
  {
    'mattn/emmet-vim',
    config = function()
      vim.g.user_emmet_leader_key = '<C-E>' -- Define el prefijo de Emmet
      vim.g.user_emmet_mode = 'i'           -- Activa Emmet solo en modo de inserción
    end,
  },
}

