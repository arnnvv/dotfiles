local M = {}

local function create_fzf_window()
  local width = vim.api.nvim_get_option('columns')
  local height = vim.api.nvim_get_option('lines')
  local win_height = math.ceil(height * 0.8)
  local win_width = math.ceil(width * 0.8)
  local row = math.ceil((height - win_height) / 2)
  local col = math.ceil((width - win_width) / 2)

  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = 'rounded',
  }

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, opts)
  return buf, win
end

function M.find_files()
  local buf, win = create_fzf_window()
  vim.fn.termopen(
    'fd --hidden --type f --exclude .git --exclude .jj | tv',
    {
      on_exit = function(_, code, _)
        if code == 0 then
          local selection = vim.api.nvim_buf_get_lines(buf, 0, -1, false)[1]
          vim.schedule(function()
            vim.api.nvim_win_close(win, true)
            if selection then
              vim.cmd('edit ' .. vim.fn.fnameescape(selection))
            end
          end)
        else
          vim.api.nvim_win_close(win, true)
        end
      end,
    }
  )
  vim.cmd('startinsert')
end

function M.grep_project()
  local buf, win = create_fzf_window()
  vim.fn.termopen(
    'rg --line-number --column --color=never --no-heading --with-filename --hidden --glob="!.git" . | tv',
    {
      on_exit = function(_, code, _)
        if code == 0 then
          local selection = vim.api.nvim_buf_get_lines(buf, 0, -1, false)[1]
          vim.schedule(function()
            vim.api.nvim_win_close(win, true)
            if selection and selection ~= '' then
              local filename, line_num, col_num = selection:match('^([^:]+):(%d+):(%d+):')
              if filename and line_num then
                vim.cmd('edit ' .. vim.fn.fnameescape(filename))
                vim.api.nvim_win_set_cursor(0, {tonumber(line_num), tonumber(col_num) - 1})
                vim.cmd('normal! zz')
              end
            end
          end)
        else
          vim.api.nvim_win_close(win, true)
        end
      end,
    }
  )
  vim.cmd('startinsert')
end

return M
