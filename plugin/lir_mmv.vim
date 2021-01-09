scriptencoding utf-8

function! s:onBufWinEnter(bufname) abort
  if a:bufname =~# '^/tmp/mmv-'
    call luaeval('require"lir.mmv".onBufWinEnter()')
  endif
endfunction

augroup lir-mmv
  autocmd!
  autocmd BufWinEnter * call s:onBufWinEnter(bufname(expand('<afile>')))
augroup END
