vim.cmd.colorscheme('habamax')

vim.api.nvim_set_hl(0, 'Normal', {
  bg = 'none',
})
vim.api.nvim_set_hl(0, 'NormalFloat', {
  bg = 'none',
})

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.shell = '/bin/dash'
vim.opt.clipboard:append('unnamedplus')
vim.opt.scrolloff = 10
vim.opt.mouse = ''
vim.opt.guicursor = ''

vim.o.undofile = true

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    require("autopair").setup_autopairs()
  end,
})
