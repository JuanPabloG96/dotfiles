-- return {
--   {
--     "nvim-treesitter/nvim-treesitter",
--     build = function()
--       require("nvim-treesitter.install").update({ with_sync = true })()
--     end,
--     config = function()
--       local ok, treesitter = pcall(require, "nvim-treesitter.configs")
--       if not ok then return end
--
--       treesitter.setup({
--         ensure_installed = {
--           "lua", "javascript", "html", "css", "python", "php", "java",
--           "scss", "go", "typescript", "tsx", "astro", "json", "markdown",
--           "bash", "regex", "vim", "c", "cpp", "rust", "yaml", "toml"
--         },
--         sync_install = false,
--         highlight = { enable = true },
--         indent = { enable = true },
--         incremental_selection = {
--           enable = true,
--           keymaps = {
--             init_selection = "<CR>",
--             node_incremental = "<CR>",
--             node_decremental = "<BS>",
--             scope_incremental = "<TAB>",
--           },
--         },
--       })
--
--       -- ✅ CONFIGURACIÓN DE FOLDING (fuera de setup)
--       vim.opt.foldmethod = 'expr'
--       vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--       vim.opt.foldlevel = 99
--       vim.opt.foldenable = false -- Comienza sin folds
--       vim.opt.foldlevelstart = 99
--     end,
--   },
--   {
--     "windwp/nvim-ts-autotag",
--     config = function()
--       require('nvim-ts-autotag').setup()
--     end,
--   },
-- }
return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Versión estable conocida
    version = "0.9.2",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Solo lo esencial
        ensure_installed = { "lua", "javascript", "bash" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
