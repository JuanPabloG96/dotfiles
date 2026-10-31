-- LSP Keymaps
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover information" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set('n', '<leader>cf', function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format code" })
vim.keymap.set('n', '<leader>ih', function()
  local filter = { bufnr = 0 }
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
end, { desc = "Toggle inlay hints" })

-- Diagnostics keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
  "n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  {
    desc = "Buffer Diagnostics (Trouble)"
  }
)
-- C y C++ debugger
vim.keymap.set("n", "<F5>", function() require("dap").continue() end)
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
vim.keymap.set("n", "<leader>b", function() require("dap").toggle_breakpoint() end)
