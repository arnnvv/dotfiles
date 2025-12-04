local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.netrw_banner = 0

vim.cmd.colorscheme('habamax')

vim.api.nvim_set_hl(0, "StatusLine", { fg = "white", bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "white", bg = "NONE" })
vim.api.nvim_set_hl(0, 'Normal', {
  bg = 'none',
})
vim.api.nvim_set_hl(0, 'NormalFloat', {
  bg = 'none',
})

vim.opt.shell = '/bin/dash'
vim.opt.clipboard:append('unnamedplus')
vim.opt.scrolloff = 10
vim.opt.mouse = ''
vim.opt.guicursor = ''
vim.opt.swapfile = false
vim.opt.linebreak = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.undofile = true

vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    require('autopair').setup_autopairs()
  end,
})
require('lsp')
require('lazy').setup({
  spec = {
    {
      import = 'cmp',
    },
  },
  rocks = {
    enabled = false,
  },
})
require('keymaps')
