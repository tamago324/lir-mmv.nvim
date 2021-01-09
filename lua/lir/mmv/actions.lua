local a = vim.api

local M = {}


function M.mmv(context)
  local cwd = context.dir
  local files = {}
  for i, f in ipairs(context.files) do
    table.insert(files, f.value)
  end

  local save_editor  = vim.env.EDITOR
  vim.env.EDITOR = "nvr --remote-wait"

  local lir_win = a.nvim_get_current_win()
  vim.cmd('tabe')
  a.nvim_tabpage_set_var(a.nvim_tabpage_get_number(0), 'lir_mmv', {
    files = context.files,
    curpos = a.nvim_win_get_cursor(lir_win)
  })

  vim.fn.termopen(vim.tbl_flatten({'mmv', files}), {
    cwd = cwd,
    on_exit = function(job_id, data, event)
      for i, tab in ipairs(a.nvim_list_tabpages()) do
        for i, win in ipairs(a.nvim_tabpage_list_wins(tab)) do
          if win == lir_win then
            a.nvim_set_current_win(win)
            vim.cmd('edit!')
          end
        end
      end
    end
  })

  vim.env.EDITOR = save_editor
end


return M
