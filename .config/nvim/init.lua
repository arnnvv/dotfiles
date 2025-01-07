local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_banner = 0

require("lazy").setup({
  spec = {
    {
      import = "plugins",
    },
  },
  rocks = {
    enabled = false,
  },
})

vim.cmd.colorscheme("habamax")

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.shell = "/bin/dash"
vim.opt.clipboard:append("unnamedplus")
vim.opt.scrolloff = 10
vim.opt.mouse = ""
vim.opt.guicursor = ""
vim.opt.hlsearch = false

vim.o.undofile = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.keymap.set("n", "<leader>n", ":Explore<CR>")
vim.keymap.set("n", "<C-s>", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<C-a>", function()
  vim.diagnostic.goto_next()
end, {
  noremap = true,
  silent = true,
})

local function setup_autopairs()
  local pairs = {
    { "(", ")" },
    { "[", "]" },
    { "{", "}" },
    { '"', '"' },
    { "'", "'" },
    { "`", "`" },
  }
  local function handle_pair(open, close)
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local at_end = col >= #line
    local next_char = at_end and "" or string.sub(line, col + 1, col + 1)
    if at_end or string.match(next_char, "%s") or string.match(next_char, "[%]})'\"%`]") then
      return open .. close .. "<Left>"
    end
    return open
  end
  for _, pair in ipairs(pairs) do
    local open, close = pair[1], pair[2]
    vim.keymap.set("i", open, function()
      return handle_pair(open, close)
    end, {
      expr = true,
      noremap = true,
    })
  end
  vim.keymap.set("i", "<BS>", function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    for _, pair in ipairs(pairs) do
      local open, close = pair[1], pair[2]
      if col > 0 and col < #line then
        local prev_char = string.sub(line, col, col)
        local next_char = string.sub(line, col + 1, col + 1)
        if prev_char == open and next_char == close then
          return "<BS><Del>"
        end
      end
    end
    return "<BS>"
  end, {
    expr = true,
    noremap = true,
  })
end

setup_autopairs()
