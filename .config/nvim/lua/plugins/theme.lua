return {
  "craftzdog/solarized-osaka.nvim",
  opts = {
    style = "night",
    priority = 1000,
    transparent = true,
  },
  config = function()
    vim.cmd.colorscheme("solarized-osaka")
  end,
}
