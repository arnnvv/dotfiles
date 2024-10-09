local keymap = vim.keymap

keymap.set("n", "<leader>r", ":source ~/.config/nvim/init.lua<CR>")
keymap.set("n", "<leader>n", ":Explore<CR>")
keymap.set("n", "<leader>m", ":Mason<CR>", {})
keymap.set("n", "<leader>l", ":Lazy<CR>", {})
keymap.set("n", "gd", vim.lsp.buf.definition, {})
keymap.set("n", "<C-a>", function()
  vim.diagnostic.goto_next()
end, { noremap = true, silent = true })
