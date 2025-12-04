vim.lsp.config('jsonls', {
  cmd = {
    'vscode-json-language-server',
    '--stdio',
  },
  filetypes = {
    'json',
    'jsonc',
  },
  init_options = {
    provideFormatter = true,
  },
})
vim.lsp.enable('jsonls')

vim.lsp.config('tailwindcss', {
  cmd = {
    'tailwindcss-language-server',
    '--stdio',
  },
  filetypes = {
    'ejs',
    'html',
    'css',
    'typescriptreact',
  },
  root_markers = {
    'postcss.config.mjs',
    'postcss.config.ts',
    'package.json',
    'node_modules',
  },
  settings = {
    tailwindCSS = {
      classAttributes = {
        'class',
        'className',
        'class:list',
        'classList',
        'ngClass',
      },
      includeLanguages = {
        eelixir = 'html-eex',
        eruby = 'erb',
        htmlangular = 'html',
        templ = 'html',
      },
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidConfigPath = 'error',
        invalidScreen = 'error',
        invalidTailwindDirective = 'error',
        invalidVariant = 'error',
        recommendedVariantOrder = 'warning',
      },
      validate = true,
    },
  },
})
vim.lsp.enable('tailwindcss')

vim.lsp.config('dartls', {})
vim.lsp.enable('dartls')

vim.lsp.config('zls', {
  cmd = { 'zls' },
  root_markers = {
    'zls.json',
    'build.zig',
    '.git',
  },
  filetypes = {
    'zig',
    'zir',
  },

  settings = {
    zls = {
      enable_inlay_hints = true,
      enable_ast_check_diagnostics = true,
      inlay_hints_show_builtin = true,
      inlay_hints_exclude_single_argument = true,
      inlay_hints_hide_redundant_param_names = false,
      inlay_hints_hide_redundant_param_names_last_token = false,
    },
  },
})
vim.lsp.enable('zls')

vim.lsp.config('ts_ls', {
  cmd = {
    'typescript-language-server',
    '--stdio',
  },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = {
    'tsconfig.json',
    'jsconfig.json',
    'package.json',
    '.git',
 },
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
})
vim.lsp.enable('ts_ls')

vim.lsp.config.rust_analyzer = {
  filetypes = { 'rust' },
  cmd = { 'rust-analyzer' },
  workspace_required = true,
  root_dir = function(buf, cb)
    local root = vim.fs.root(buf, { 'Cargo.toml', 'rust-project.json' })
    local out = vim.system({ 'cargo', 'metadata', '--no-deps', '--format-version', '1' }, { cwd = root }):wait()
    if out.code ~= 0 then
      return cb(root)
    end

    local ok, result = pcall(vim.json.decode, out.stdout)
    if ok and result.workspace_root then
      return cb(result.workspace_root)
    end

    return cb(root)
  end,
  settings = {
    autoformat = false,
    ['rust-analyzer'] = {
      check = {
        command = 'clippy',
      },
      cargo = {
        features = "all",
      },
    },
  },
}
vim.lsp.enable('rust_analyzer')

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = {
    'go',
    'gomod',
    'gowork',
    'gotmpl',
  },
  root_dir = vim.fs.root(0, {
    'go.work',
    'go.mod',
    '.git',
  }),
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      analyses = { unusedparams = true },
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
})
vim.lsp.enable('gopls')

vim.lsp.config.clangd = {
  cmd = {
    'clangd',
    '-j=' .. 2,
    '--background-index',
    '--clang-tidy',
    '--inlay-hints',
    '--fallback-style=llvm',
    '--all-scopes-completion',
    '--completion-style=detailed',
    '--header-insertion=iwyu',
    '--header-insertion-decorators',
    '--pch-storage=memory',
  },
  filetypes = {
    'c',
    'cpp',
    'objc',
    'objcpp',
    'cuda',
    'proto',
  },
  root_markers = {
    'CMakeLists.txt',
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git',
    vim.uv.cwd(),
  },
}
vim.lsp.enable('clangd')

vim.lsp.config('pyright', {
  cmd = {
    'pyright-langserver',
    '--stdio',
  },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
        typeCheckingMode = 'basic',
      },
    },
  },
})

vim.lsp.enable('pyright')
