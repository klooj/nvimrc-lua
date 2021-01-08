packadd nvim-luadev

nmap <leader>D5l <Plug>(Luadev-RunLine)
vmap <leader>D5v <Plug>(Luadev-Run)
nmap <leader>D5w <Plug>(Luadev-Runword)
" imap <> <Plug>(Luadev-Complete)

let g:which_key_map.D.5 = {
      \ 'name'  : '+lua repl'                 ,
      \ 'v' : 'run visual selection'           ,
      \ 'l' : 'run current line'               ,
      \ 'w' : 'run/evaluate word under cursor' ,
      \}
