return {
  'saghen/blink.cmp',
  version = '1.*',
  lazy = true,
  init = function()
    local lsp_attached_bufs = {}

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        lsp_attached_bufs[args.buf] = true
      end,
    })

    vim.api.nvim_create_autocmd("InsertEnter", {
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        if lsp_attached_bufs[buf] then
          require("lazy").load({ plugins = { "blink.cmp" } })
          lsp_attached_bufs[buf] = nil
        end
      end,
    })
  end,
  opts = {
    appearance = {
      nerd_font_variant = 'mono',
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
    fuzzy = {
      implementation = 'rust',
    }
  },
  opts_extend = {
    'sources.default',
  },
}
