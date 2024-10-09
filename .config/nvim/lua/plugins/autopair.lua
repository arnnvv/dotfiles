return {
  {
    "altermo/ultimate-autopair.nvim",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    branch = "v0.6",
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    ft = {
      "typescriptreact",
      "astro",
      "svelte",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
