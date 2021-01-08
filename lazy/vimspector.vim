packadd vimspector
packadd telescope-vimspector.nvim

let g:which_key_map.D.3 = {
      \ 'name'  : '+vimspector'               ,
      \ 'a' : [':<Plug>VimspectorAddFunctionBreakpoint'       , 'add func breakpoint']   ,
      \ 'b' : [':<Plug>VimspectorToggleBreakpoint'            , 'toggle breakpoint']     ,
      \ 'B' : [':<Plug>VimspectorToggleConditionalBreakpoint' , 'toggle conditional bp'] ,
      \ 'c' : [':<Plug>VimspectorContinue'                    , 'continue']              ,
      \ 'g' : [':vimspector#GetConfigurations()'              , 'get configs']           ,
      \ 'i' : [':<Plug>VimspectorStepInto'                    , 'step into']             ,
      \ 'l' : [':vimspector#Launch()'                         , 'get configs']           ,
      \ 'o' : [':<Plug>VimspectorStepOut'                     , 'step out']              ,
      \ 'O' : [':<Plug>VimspectorStepOver'                    , 'step over']             ,
      \ 'p' : [':<Plug>VimspectorPause'                       , 'pause']                 ,
      \ 'R' : [':<Plug>VimspectorRestart'                     , 'restart']               ,
      \ 'r' : [':<Plug>VimspectorRunToCursor'                 , 'run to cursor']         ,
      \ 's' : [':<Plug>VimspectorStop'                        , 'stop']                  ,
      \ 'u' : [':VimspectorUpdate'                            , 'update']                ,
      \}

" vim.g.vimspector_enable_mappings = 'HUMAN'
" F5	When debugging, continue. Otherwise start debugging.	vimspector#Continue()
" F3	Stop debugging.	vimspector#Stop()
" F4	Restart debugging with the same configuration.	vimspector#Restart()
" F6	Pause debugee.	vimspector#Pause()
" F9	Toggle line breakpoint on the current line.	vimspector#ToggleBreakpoint()
" <leader>F9	Toggle conditional line breakpoint on the current line.	vimspector#ToggleBreakpoint( { trigger expr, hit count expr } )
" F8	Add a function breakpoint for the expression under cursor	vimspector#AddFunctionBreakpoint( '<cexpr>' )
" <leader>F8	Run to Cursor	vimspector#RunToCursor()
" F10	Step Over	vimspector#StepOver()
" F11	Step Into	vimspector#StepInto()
" F12	Step out of current function scope	vimspector#StepOut()
