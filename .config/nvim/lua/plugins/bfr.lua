return {
  "desdic/marlin.nvim",
  opts = {},
  keys = {
    {
      "<leader>a",
      function() require("marlin").add() end,
    },
    {
      "<leader>r",
      function() require("marlin").remove() end,
    },
    {
     "<leader>d",
     function() require("marlin").remove_all() end,
    },
    {
      "<leader>f]",
      function() require("marlin").move_up() end,
    },
    {
      "<leader>f[",
      function() require("marlin").move_down() end,
    },
    {
      "<C-e>",
      function() require("marlin").sort() end,
    },
    {
      "<C-.>",
      function() require("marlin").next() end,
    },
    {
      "<C-,>",
      function() require("marlin").prev() end,
    },
    {
      "<leader><leader>",
      function() require("marlin").toggle() end,
    },
    {
      "<C-1>",
      function() require("marlin").open(1) end,
    },
    {
      "<C-2>",
      function() require("marlin").open(2) end,
    },
    {
      "<C-3>",
      function() require("marlin").open(3) end,
    },
    {
      "<C-4>",
      function() require("marlin").open(4) end,
    },
  },
}
