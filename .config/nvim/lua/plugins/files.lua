return {
  {
    "ibhagwan/fzf-lua",
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
  },
  {
    "desdic/marlin.nvim",
    opts = {},
    keys = {
      {
        "<leader>a",
        function()
          require("marlin").add()
        end,
      },
      {
        "<leader>r",
        function()
          require("marlin").remove()
        end,
      },
      {
        "<leader>d",
        function()
          require("marlin").remove_all()
        end,
      },
      {
        "<C-.>",
        function()
          require("marlin").next()
        end,
      },
      {
        "<C-,>",
        function()
          require("marlin").prev()
        end,
      },
      {
        "<leader><leader>",
        function()
          require("marlin").toggle()
        end,
      },
      {
        "<C-1>",
        function()
          require("marlin").open(1)
        end,
      },
      {
        "<C-2>",
        function()
          require("marlin").open(2)
        end,
      },
      {
        "<C-3>",
        function()
          require("marlin").open(3)
        end,
      },
      {
        "<C-4>",
        function()
          require("marlin").open(4)
        end,
      },
    },
  },
}
