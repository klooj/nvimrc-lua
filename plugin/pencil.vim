function! Prose()
	packadd vim-pencil
	call pencil#init()
	" call litecorrect#init()

	" manual reformatting shortcuts
	" nnoremap <buffer> <silent> Q gqap
	" xnoremap <buffer> <silent> Q gq
	" nnoremap <buffer> <silent> <localleader>Q vapJgqap

	" force top correction on most recent misspelling
	nnoremap <buffer> <localleader>s [s1z=<c-o>
	" nnoremap <buffer> <localleader>x [s1z=<c-o>
	" nnoremap <buffer> <localleader>x :ToggleCheckbox<CR>
" inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u

	" replace common punctuation
	" iabbrev <buffer> -- –
	" iabbrev <buffer> --- —
	" iabbrev <buffer> << «
	" iabbrev <buffer> >> »

	" open most folds
	" setlocal foldlevel=6
	" set nofoldenable

	" " highlight words (reedes/vim-wordy)
	" noremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
	" xnoremap <silent> <buffer> <F8> :<C-u>NextWordy<cr>
	" inoremap <silent> <buffer> <F8> <C-o>:NextWordy<cr>

endfunction

" automatically initialize buffer by file type
autocmd FileType markdown call Prose()

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()

" check this out
" https://github.com/reedes/vim-thematic
