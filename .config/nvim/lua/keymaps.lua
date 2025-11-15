vim.keymap.set('n', '<leader>n', ':Explore<CR>')
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
vim.keymap.set('n', 'd', '"_d', { noremap = true })
vim.keymap.set('n', 'D', '"_D', { noremap = true })
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format)
vim.keymap.set(
  'n',
  '<C-s>',
  vim.lsp.buf.definition,
  {
    noremap = true,
    silent = true,
  }
)
vim.keymap.set(
  'n',
  '<C-a>',
  vim.diagnostic.goto_next,
  {
    noremap = true,
    silent = true,
  }
)
vim.keymap.set(
  'n',
  '<C-p>',
  function()
    require('fzf').find_files()
  end,
  {
    noremap = true,
    silent = true,
  }
)
vim.keymap.set(
  'n',
  '<C-o>',
  function()
    require('fzf').grep_project()
  end,
  {
    noremap = true,
    silent = true,
  }
)
