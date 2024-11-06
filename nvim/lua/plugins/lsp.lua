return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "mfussenegger/nvim-lint",
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",          -- Autocompletado
            "hrsh7th/cmp-nvim-lsp",      -- Fuentes para LSP
            "hrsh7th/cmp-buffer",         -- Fuentes para buffers
            "hrsh7th/cmp-path",           -- Fuentes para rutas
            "hrsh7th/cmp-cmdline",        -- Fuentes para línea de comandos
            "saadparwaiz1/cmp_luasnip",   -- Soporte para snippets
            "L3MON4D3/LuaSnip",           -- Snippet engine
        },
        config = function()
            -- Configuración de Mason
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "pyright", "gopls", "html", "cssls", "phpactor" },
            })
  
            -- Configuración de LSP
            local lspconfig = require("lspconfig")
  
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        },
                    },
                },
            }
  
            -- Configuración de nvim-cmp
            local cmp = require("cmp")
            cmp.setup {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- Con Luasnip
                    end,
                },
                mapping = {
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'cmdline' },
                    { name = 'luasnip' },  -- Snippets
                },
            }
  
            -- Configuración de Luasnip
            local luasnip = require('luasnip')
            luasnip.snippets = {
                all = {
                    luasnip.parser.parse_snippet("trigger", "Your snippet text here"),
                },
            }
  
            -- Configuración de null-ls
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.prettier,
                    require("null-ls").builtins.diagnostics.eslint,
                    require("null-ls").builtins.formatting.stylua,
                },
            })
  
            -- Configuración de DAP
            require("dapui").setup()
            require("dap").configurations.lua = {
                {
                    type = "lua",
                    request = "attach",
                    name = "Attach to running Neovim instance",
                    script = "${file}",
                },
            }
  
            require("dap").adapters.lua = {
                type = "executable",
                command = "path/to/lua-debug-adapter",
                args = { "--port", "8086" },
            }
        end,
    },
  }
  