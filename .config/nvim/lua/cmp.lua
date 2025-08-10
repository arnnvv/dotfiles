return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    appearance = {
      nerd_font_variant = 'mono',
    },
    keymap = {
      preset = 'enter',
    },
    completion = {
      documentation = {
        auto_show = false,
      },
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
    fuzzy = {
      implementation = 'rust',
    },
  },
  opts_extend = {
    'sources.default',
  },
}
