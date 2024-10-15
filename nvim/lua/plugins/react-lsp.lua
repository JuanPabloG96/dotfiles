return {
  -- Instalar y configurar el servidor de TypeScript para React
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim", -- Plugin que ayuda con la configuración de TypeScript
    },
    config = function()
      -- Configurar LSP para TypeScript/React
      require("lspconfig").tsserver.setup({
        on_attach = function(client, bufnr)
          -- Habilitar autoformateo al guardar
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }, -- Agrega soporte para .tsx, .jsx, .ts, .js
        cmd = { "typescript-language-server", "--stdio" },
      })
    end,
  },

  -- Configurar autocompletado con nvim-cmp para React
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Fuente de autocompletado para LSP
      "hrsh7th/cmp-buffer", -- Fuente de autocompletado para buffer
      "hrsh7th/cmp-path", -- Fuente de autocompletado para rutas de archivos
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar la selección con Enter
        },
        sources = {
          { name = "nvim_lsp" }, -- Fuente de autocompletado para LSP
          { name = "buffer" }, -- Autocompletado desde el buffer
          { name = "path" }, -- Autocompletado para rutas
        },
      })
    end,
  },
}
