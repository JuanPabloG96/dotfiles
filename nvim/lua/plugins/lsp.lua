return {
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "windwp/nvim-autopairs",
      },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = {
            -- Web Development
            "ts_ls",    
            "eslint",      
            "html",        
            "cssls",       
            "tailwindcss", 
            -- PHP
            "intelephense",
            -- Python
            "pyright",     
            -- Java
            "jdtls",      
            -- Otros útiles
            "lua_ls",      
            "jsonls",     
          },
          automatic_installation = true,
        })
  
        -- Configuración de diagnóstico
        vim.diagnostic.config({
          update_in_insert = true,
          virtual_text = true,
          signs = true,
          underline = true,
          severity_sort = true,
          float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
          },
        })
  
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require("lspconfig")
  
        -- Configuración para cada lenguaje
        lspconfig.ts_ls.setup({ capabilities = capabilities })
        lspconfig.eslint.setup({ capabilities = capabilities })
        lspconfig.html.setup({ capabilities = capabilities })
        lspconfig.cssls.setup({ capabilities = capabilities })
        lspconfig.intelephense.setup({ capabilities = capabilities })
        lspconfig.pyright.setup({ capabilities = capabilities })
        lspconfig.jdtls.setup({ capabilities = capabilities })
        lspconfig.tailwindcss.setup({
          capabilities = capabilities,
          filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        })
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              },
            },
          },
        })
        lspconfig.jsonls.setup({ capabilities = capabilities })
  
        -- Configuración de autopairs
        require('nvim-autopairs').setup({
          check_ts = true,
          ts_config = {
            lua = {'string'},
            javascript = {'template_string'},
            java = false,
          }
        })
  
        -- Configuración de autocompletado
        local cmp = require("cmp")
        local luasnip = require("luasnip")
  
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true
            }),
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { 'i', 's' }),
          },
          sources = {
            { name = 'nvim_lsp', priority = 1000 },
            { name = 'luasnip', priority = 750 },
            { name = 'buffer', priority = 500 },
            { name = 'path', priority = 250 },
          },
        })
      end,
    }
  }
  