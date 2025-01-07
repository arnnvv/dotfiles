return {
  "ibhagwan/fzf-lua",
  cmd = "Fzflua",
  opts = {
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
    grep = {
      rg_glob = true,
      glob_flag = "--iglob",
    },
    previewers = {
        builtin = {
          syntax_limit_b = 1024 * 100,
        },
    },
  },
  keys = {
    {
      "<C-p>",
      "<cmd>FzfLua git_files<CR>",
    },
    {
      "<C-o>",
      "<cmd>FzfLua grep_project<CR>",
    },
    {
      "<C-l>",
      "<cmd>FzfLua files<CR>",
    },
  },
}
