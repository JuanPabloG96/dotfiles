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
  },

  callback = function(args)
    pcall(function()
      vim.lsp.buf.format({
        bufnr = args.buf,
        async = false,
        timeout_ms = 2000,
      })
    end)
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
