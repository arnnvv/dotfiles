local keymap = vim.keymap

keymap.set("n", "<leader>n", ":Explore<CR>")
keymap.set("n", "<C-s>", vim.lsp.buf.definition, {})
keymap.set("n", "<C-a>", function()
  vim.diagnostic.goto_next()
end, {
  noremap = true,
  silent = true,
})
