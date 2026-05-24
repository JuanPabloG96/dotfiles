return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",           -- CRÍTICO para nvim 0.10+
  build = ":TSUpdate",
  lazy = false,              -- cargar en startup para evitar flickers
  config = function()
    require("nvim-treesitter").setup({
      -- Parsers que quieres instalar automáticamente
      ensure_installed = {
        "lua", "vim", "vimdoc", "query",   -- siempre instala estos
        "python", "javascript", "typescript",
        "rust", "go", "c", "cpp",
        "json", "yaml", "toml", "markdown",
        "bash", "html", "css",
      },

      -- Instalar parsers de forma síncrona al abrir (evita errores de "parser not found")
      sync_install = false,

      -- Auto-instalar parser si no está al abrir el archivo
      auto_install = true,

      highlight = {
        enable = true,
        -- Deshabilitar para archivos muy grandes (evita lag)
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        -- Necesario en algunos setups para evitar conflictos con vim regex highlighting
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },
    })
  end,
}

