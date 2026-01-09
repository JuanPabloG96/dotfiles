vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.js", "*.jsx", "*.ts", "*.tsx",
    "*.lua",
    "*.py",
    "*.java",
    "*.cpp", "*.h", "*.hpp", "*.c",
    "*.sh", "*.zsh",
    "*.json", "*.yaml", "*.yml",
    "*.html", "*.css", "*.scss",
    "*.md",
    "*.php"
  },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
