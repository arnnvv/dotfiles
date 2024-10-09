return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts_install = require("nvim-treesitter.install")
    ts_install.prefer_git = true

    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "typescript",
        "javascript",
        "rust",
        "go",
        "sql",
        "zig",
        "json",
        "yaml",
        "toml",
        "markdown",
        "tsx",
        "astro",
        "gitignore",
        "bash",
        "nix"
      },
      auto_install = false,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
    })
  end,
}
