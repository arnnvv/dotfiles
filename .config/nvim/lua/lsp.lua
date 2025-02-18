return {
  {
    'saghen/blink.cmp',
    event = {
      'LspAttach',
    },
    version = '*',
    opts = {
      appearance = {
        nerd_font_variant = 'mono',
        use_nvim_cmp_as_default = true,
      },
      keymap = {
        preset = 'enter',
      },
      sources = {
        default = {
          'lsp',
          'path',
          'buffer',
        },
      },
      cmdline = {
        enabled = false,
      },
    },
    opts_extend = {
      'sources.default',
    },
  },
  {
    'neovim/nvim-lspconfig',
    cmd = {
      'LspInfo',
      'LspInstall',
      'LspUninstall',
    },
    event = {
      'BufNewFile',
      'BufReadPost',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      require('lspconfig.configs').solidity = {
        default_config = {
          cmd = {
	    'nomicfoundation-solidity-language-server',
	    '--stdio',
          },
          filetypes = {
	    'solidity',
          },
          root_dir = lspconfig.util.find_git_ancestor,
          single_file_support = true,
        },
      }

      local servers = {
        jsonls = {},
        solidity = {
	  on_attach = on_attach,
        },
        tailwindcss = {},
        clangd = {
          cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--log=verbose',
          },
          init_options = {
            fallbackFlags = {
              '-std=c++23',
            },
          },
        },

        zls = {
          settings = {
            zls = {
              enable_inlay_hints = true,
              inlay_hints_show_builtin = true,
              inlay_hints_exclude_single_argument = true,
              inlay_hints_hide_redundant_param_names = false,
              inlay_hints_hide_redundant_param_names_last_token = false,
            },
          },
        },

        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'literal',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },

        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              inlayHints = {
                bindingModeHints = {
                  enable = false,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  enable = true,
                  minLines = 25,
                },
                closureReturnTypeHints = {
                  enable = 'never',
                },
                lifetimeElisionHints = {
                  enable = 'never',
                  useParameterNames = false,
                },
                maxLength = 25,
                parameterHints = {
                  enable = true,
                },
                reborrowHints = {
                  enable = 'never',
                },
                renderColons = true,
                typeHints = {
                  enable = true,
                  hideNamedConstructor = false,
                  hideClosureInitialization = false,
                },
              },
            },
          },
        },

        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              staticcheck = true,
              analyses = {
                unusedparams = true,
              },
              completeUnimported = true,
              hints = {
                parameterNames = true,
                constantValues = true,
                rangeVariableTypes = true,
                assignVariableTypes = true,
                compositeLiteralTypes = true,
                functionTypeParameters = true,
                compositeLiteralFields = true,
              },
            },
          },
          filetype = {
            'go',
            'gomod',
            'gowork',
            'gotmpl',
          },
          root_dir = require('lspconfig/util').root_pattern('go.work', 'go.mod', '.git'),
          cmd = {
            'gopls',
          },
        },
      }

      for server, config in pairs(servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end
    end,
  },
}
