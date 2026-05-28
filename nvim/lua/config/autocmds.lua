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
    "*.php",
    "*.astro"
  },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "h", "hpp", "tpp" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})
