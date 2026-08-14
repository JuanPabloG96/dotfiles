return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      local parsers = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "c",
        "cpp",
        "python",
        "javascript",
        "typescript",
        "html",
        "css",
        "json",
      }

      for _, parser in ipairs(parsers) do
        ts.install(parser)
      end

      -- El filetype de nvim no siempre coincide 1:1 con el nombre del
      -- parser (ej. "typescriptreact" vs "tsx"), así que resolvemos los
      -- filetypes reales de cada parser en vez de usar la lista de arriba.
      local patterns = {}
      for _, parser in ipairs(parsers) do
        for _, ft in ipairs(vim.treesitter.language.get_filetypes(parser)) do
          table.insert(patterns, ft)
        end
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = patterns,
        callback = function()
          -- Highlighting vía treesitter
          pcall(vim.treesitter.start)
          -- Indentación vía treesitter (experimental, comillas específicas)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- Asegura que .tpp se reconozca como C++ (no es un filetype nativo de Vim)
      vim.filetype.add({
        extension = {
          tpp = "cpp",
        },
      })
    end,
  },
}
