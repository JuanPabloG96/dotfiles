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
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
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
        "cmake-language-server",
        "lua_ls",
        "jsonls",
      },
      automatic_installation = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Configurar diagnósticos
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

      -- Helper function para configurar servidores
      local function setup_server(server_name, config)
        config = config or {}
        config.capabilities = capabilities
        vim.lsp.config(server_name, config)
        vim.lsp.enable(server_name)
      end

      -- C/C++ Configuration
      setup_server('clangd', {
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
        root_markers = {
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        },
        settings = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true
        },
      })

      -- CMake Configuration
      setup_server('cmake-language-server')

      -- TypeScript/React Configuration
      setup_server('ts_ls', {
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
      setup_server('eslint', {
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
      setup_server('html')
      setup_server('cssls')
      setup_server('intelephense')
      setup_server('pyright')
      setup_server('jdtls')

      -- Tailwind Configuration
      setup_server('tailwindcss', {
        filetypes = {
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact"
        },
      })

      -- Emmet Configuration
      setup_server('emmet_ls', {
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
      setup_server('lua_ls', {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = { enable = false },
            diagnostics = {
              globals = { "vim" },
            },
          }
        }
      })

      -- JSON Configuration
      setup_server('jsonls')
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "lukas-reineke/cmp-under-comparator",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require('lspkind')

      require("luasnip.loaders.from_vscode").lazy_load()

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
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
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
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp', priority = 1000 },
          { name = 'luasnip',  priority = 750 },
          { name = 'buffer',   priority = 500 },
          { name = 'path',     priority = 250 },
        }),
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
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
        ts_config = {
          lua = { 'string' },
          javascript = { 'template_string' },
          java = false,
        }
      })

      -- Integrar con nvim-cmp
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
}
