packadd nvim-dap
packadd nvim-dap-virtual-text
packadd nvim-dap-python
packadd telescope-dap.nvim

lua require('klooj.dap')

let g:which_key_map.D.4 = {
      \ 'name'  : '+DAP'                      ,
      \ 'B' : 'set breakpoint'     ,
      \ 'b' : 'toggle breakpoint'  ,
      \ 'c' : 'continue'           ,
      \ 'i' : 'step into'          ,
      \ 'l' : 'log breakpoint'     ,
      \ 'O' : 'step out'           ,
      \ 'o' : 'step over'          ,
      \ 'R' : 'dap: repl run last' ,
      \ 'r' : 'open repl'          ,
      \}
