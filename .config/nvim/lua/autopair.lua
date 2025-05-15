local M = {}

function M.setup_autopairs()
  local pairs = {
    { '(', ')' },
    { '[', ']' },
    { '{', '}' },
    { '"', '"' },
    { "'", "'" },
    { '`', '`' },
  }
  local function handle_pair(open, close)
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local at_end = col >= #line
    local next_char = at_end and '' or string.sub(line, col + 1, col + 1)
    if at_end or string.match(next_char, '%s') or string.match(next_char, '[%]})\'"%`]') then
      return open .. close .. '<Left>'
    end
    return open
  end
  for _, pair in ipairs(pairs) do
    local open, close = pair[1], pair[2]
    vim.keymap.set('i', open, function()
      return handle_pair(open, close)
    end, {
      expr = true,
      noremap = true,
    })
  end
  vim.keymap.set('i', '<BS>', function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    for _, pair in ipairs(pairs) do
      local open, close = pair[1], pair[2]
      if col > 0 and col < #line then
        local prev_char = string.sub(line, col, col)
        local next_char = string.sub(line, col + 1, col + 1)
        if prev_char == open and next_char == close then
          return '<BS><Del>'
        end
      end
    end
    return '<BS>'
  end, {
    expr = true,
    noremap = true,
  })
end

return M
