return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.g.codeium_enabled = true
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<C-;>', function() return vim.fn['codeium#CycleNext']() end, { expr = true })
      vim.keymap.set('i', '<C-,>', function() return vim.fn['codeium#CyclePrev']() end, { expr = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      -- Agregar mapeos para activar/desactivar Codeium
      vim.keymap.set('n', '<C-d>c', function()
        vim.g.codeium_enabled = not vim.g.codeium_enabled
        print("Codeium " .. (vim.g.codeium_enabled and "activado" or "desactivado"))
      end)
    end
  }
}
