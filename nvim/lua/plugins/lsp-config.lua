return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
    build = ":MasonUpdate",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "ts_ls",
        "eslint",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_ls",
        "intelephense",
        "pyright",
        "jdtls",
        "clangd",
        "cmake",
        "lua_ls",
        "jsonls",
      },
      automatic_installation = true,
    },
    config = function()
      require("mason-lspconfig").setup()
    end,
  },

  -- nvim-lspconfig: Configuración de los servidores de lenguaje
  {
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
        "onsails/lspkind.nvim",
        "lukas-reineke/cmp-under-comparator",
        "nvim-treesitter/nvim-treesitter",
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
            "emmet_ls",
            -- PHP
            "intelephense",
            -- Python
            "pyright",
            -- Java
            "jdtls",
            -- C/C++
            "clangd",
            "cmake",
            -- Otros útiles
            "lua_ls",
            "jsonls",
          },
          automatic_installation = true,
        })

        vim.api.nvim_set_hl(0, "DiagnosticErrorCustom", { fg = "#FF0000" })
        vim.api.nvim_set_hl(0, "DiagnosticWarnCustom", { fg = "#FFA500" })
        vim.api.nvim_set_hl(0, "DiagnosticInfoCustom", { fg = "#00FFFF" })
        vim.api.nvim_set_hl(0, "DiagnosticHintCustom", { fg = "#00FF00" })
        vim.diagnostic.config({
          update_in_insert = true,
          virtual_text = {
            source = "always",
            prefix = '● ',
            format = function(diagnostic)
              if diagnostic.severity == vim.diagnostic.severity.ERROR then
                return string.format("%s", diagnostic.message)
              end
              return diagnostic.message
            end,
            severity_limit = vim.diagnostic.severity.WARN,
          },
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
        -- C/C++ Configuration
        lspconfig.clangd.setup({
          capabilities = capabilities,
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm"
          },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          root_dir = lspconfig.util.root_pattern(
            '.clangd',
            '.clang-tidy',
            '.clang-format',
            'compile_commands.json',
            'compile_flags.txt',
            'configure.ac',
            '.git'
          ),
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true
          },
        })

        -- CMake Configuration
        lspconfig.cmake.setup({
          capabilities = capabilities,
        })

        -- TypeScript/React Configuration
        lspconfig.ts_ls.setup({
          capabilities = capabilities,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayVariableTypeHints = true,
                includeInlayFunctionParameterTypeHints = true
              }
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayVariableTypeHints = true,
                includeInlayFunctionParameterTypeHints = true
              }
            }
          },
          filetypes = {
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact'
          }
        })

        -- ESLint Configuration
        lspconfig.eslint.setup({
          capabilities = capabilities,
          settings = {
            validate = "on",
            experimental = {
              useFlatConfig = true
            },
            run = "onSave",
            rules = {
              ["react/react-in-jsx-scope"] = "off"
            }
          }
        })

        -- Other languages Configuration
        lspconfig.html.setup({ capabilities = capabilities })
        lspconfig.cssls.setup({ capabilities = capabilities })
        lspconfig.intelephense.setup({ capabilities = capabilities })
        lspconfig.pyright.setup({ capabilities = capabilities })
        lspconfig.jdtls.setup({ capabilities = capabilities })
        -- Tailwind Configuration
        lspconfig.tailwindcss.setup({
          capabilities = capabilities,
          filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact"
          },
        })

        -- Emmet Configuration
        lspconfig.emmet_ls.setup({
          capabilities = capabilities,
          filetypes = {
            "html",
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact"
          }
        })

        -- Lua Configuration
        lspconfig.lua_ls.setup({
          capabilities = capabilities,
          settings = {
            workspace = { checkThirdParty = false, library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
            diagnostics = {
              globals = { "vim" },
            },
          }
        }
        )

        lspconfig.jsonls.setup({ capabilities = capabilities })

        -- Autopairs Configuration
        require('nvim-autopairs').setup({
          check_ts = true,
          ts_config = {
            lua = { 'string' },
            javascript = { 'template_string' },
            java = false,
          }
        })

        -- Autocompletion Configuration
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require('lspkind')

        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          formatting = {
            format = lspkind.cmp_format({
              mode = 'symbol_text',
              maxwidth = 50,
              ellipsis_char = '...',
            })
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
            { name = 'luasnip',  priority = 750 },
            { name = 'buffer',   priority = 500 },
            { name = 'path',     priority = 250 },
          },
          sorting = {
            comparators = {
              cmp.config.compare.offset,
              cmp.config.compare.exact,
              cmp.config.compare.score,
              require("cmp-under-comparator").under,
              cmp.config.compare.kind,
              cmp.config.compare.sort_text,
              cmp.config.compare.length,
              cmp.config.compare.order,
            },
          }
        })
      end,
    }
  }
}
