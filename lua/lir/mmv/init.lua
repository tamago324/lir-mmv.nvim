local a = vim.api

local M = {}

local function highlight(files)
  local ns = a.nvim_create_namespace('lir_mmv_dir')
  a.nvim_buf_clear_namespace(0, ns, 0, -1)
  for i, file in ipairs(files) do
    if file.is_dir then
      a.nvim_buf_add_highlight(0, ns, 'PreProc', i - 1, 0, -1)
    end
  end
end

function M.onBufWinEnter()
  -- I'd like to use `EDITOR='nvr --remote-wait +"set bufhidden=wipe"'`, but I can't.
  vim.cmd('setlocal bufhidden=wipe')
  local info = a.nvim_tabpage_get_var(a.nvim_tabpage_get_number(0), 'lir_mmv')
  highlight(info.files)
  a.nvim_win_set_cursor(0, info.curpos)
end

return M
