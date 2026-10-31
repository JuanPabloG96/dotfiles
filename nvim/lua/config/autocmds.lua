vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.lua",
    "*.js",
    "*.jsx",
    "*.ts",
    "*.tsx",
    "*.py",
    "*.cpp",
    "*.c",
    "*.h",
    "*.hpp",
    "*.tpp",
    "*.java",
    "*.php",
    "*.sh",
    "*.zsh",
    "*.css",
    "*.html",
    "*.json",
    "*.jsonc",
  },
  callback = function(args)
    pcall(function()
      require("conform").format({
        bufnr = args.buf,
        async = false,
        timeout_ms = 2000,
        lsp_format = "fallback",
      })
    end)
  end,
})
