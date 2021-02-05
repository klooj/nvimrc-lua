" agnostic version for example:
" function! WikiJStamp()
" 	let l:stamp = strftime("|%H:00|")
" 	let l:res = 0
" 	exe "g/" . l:stamp . "/let l:res = l:res+1"
" 	if (l:res == 0)
" 		$pu=l:stamp
" 		normal G
" 		right 80
" 		exe "normal o \<C-O>d0"
" 	endif
" endfunction

" augroup journalHourlyStamp
" 	au!
" 	au BufEnter /path/to/journal/*.wiki call WikiJStamp()
" augroup end
