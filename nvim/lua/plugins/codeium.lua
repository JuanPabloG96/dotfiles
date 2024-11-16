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
    end
  }
}
