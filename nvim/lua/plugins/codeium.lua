return {
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.g.codeium_enabled = true
      vim.g.codeium_disable_bindings = 1
      local function safe_call(fn)
        local ok, result = pcall(fn)
        return ok and result or ''
      end
      vim.keymap.set('i', '<C-g>', function() return safe_call(vim.fn['codeium#Accept']) end, { expr = true })
      vim.keymap.set('i', '<C-;>', function() return safe_call(vim.fn['codeium#CycleNext']) end, { expr = true })
      vim.keymap.set('i', '<C-,>', function() return safe_call(vim.fn['codeium#CyclePrev']) end, { expr = true })
      vim.keymap.set('i', '<C-x>', function() return safe_call(vim.fn['codeium#Clear']) end, { expr = true })
      -- Agregar mapeo para activar/desactivar Codeium
      vim.keymap.set('n', '<C-d>c', function()
        vim.g.codeium_enabled = not vim.g.codeium_enabled
        print("Codeium " .. (vim.g.codeium_enabled and "activado" or "desactivado"))
      end)
    end
  }
}

