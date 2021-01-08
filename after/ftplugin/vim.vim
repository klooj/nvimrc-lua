setlocal fo=j,n,q,r fo-=c fo-=o fo-=t tw=80 ts=4 sts=4 sw=4 noexpandtab
" augroup vimFileOptKludge
  " au!
  " au BufEnter * setlocal fo -=c fo -=o fo +=n tw=80 ts=2 sts=2 sw=2 expandtab
" augroup end

" default njcroql
" endfunction
" extra: col
" set formatoptions +=
" set formatoptions -=a
" set formatoptions -=t
" setlocal formatoptions-=o
setlocal iskeyword+=:,#
setlocal tags+=$XDG_CACHE_HOME/tags
" setlocal tags+=$DATA_PATH/tags
