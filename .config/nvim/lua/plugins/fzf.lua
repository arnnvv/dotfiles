return {
  "ibhagwan/fzf-lua",
  config = function()
    require("fzf-lua").setup({
      defaults = {
        file_icons = false,
        color_icons = false,
        git_icons = false,
      },
      files = {
        previewer = false,
      },
      git = {
        files = {
          previewer = false,
        },
      },
    })
    vim.keymap.set("n", "<C-p>", "<cmd>FzfLua git_files<cr>", {})
    vim.keymap.set("n", "<C-o>", "<cmd>FzfLua live_grep<cr>", {})
    vim.keymap.set("n", "<C-l>", "<cmd>FzfLua files<cr>", {})
    vim.keymap.set(
      "n",
      "<leader>cs",
      ":lua require'fzf-lua'.lsp_document_symbols({winopts = {preview={wrap='wrap'}}})<cr>",
      {}
    )
    vim.keymap.set(
      "n",
      "<leader>ca",
      ":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01, col=0, height=0.2, width=0.4} })<cr>",
      {}
    )
    vim.keymap.set("n", "<leader>cr", require("fzf-lua").lsp_references, {})
  end,
}
