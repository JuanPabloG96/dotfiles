-- Formato automático al guardar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.js", "*.jsx", "*.ts", "*.tsx", -- JavaScript / TypeScript
    "*.lua",                          -- Lua
    "*.py",                           -- Python
    "*.go",                           -- Go
    "*.rs",                           -- Rust
    "*.java",                         -- Java
    "*.cpp", "*.h", "*.hpp", "*.c",   -- C / C++
    "*.sh", "*.zsh",                  -- Shell scripts
    "*.json", "*.yaml", "*.yml",      -- Config files
    "*.html", "*.css", "*.scss",      -- Web
    "*.md"                            -- Markdown
  },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
