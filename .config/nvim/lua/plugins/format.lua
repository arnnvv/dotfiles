return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "biome", stop_after_first = true },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        css = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        graphql = { "biome" },
        lua = { "stylua" },
        rust = { "rustfmt", lsp_format = "fallback" },
        zig = { "zigfmt" },
        toml = { "taplo" },
        go = { "gofumpt" },
        yaml = { "yamlfmt" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    local augroup = vim.api.nvim_create_augroup("AutoFormatGroup", { clear = true })

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      pattern = "*",
      callback = function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
    })
  end,
}
