let g:pencil#wrapModeDefault = 'soft'
let g:pencil#autoformat = 1

" let g:pencil#map#suspend_af = 'K'   " default is no mapping
" Using the above mapping, with Ko you’ll enter Insert mode with the cursor on a new line, but autoformat will suspend for that Insert. Using o by itself will retain autoformat.
let g:pencil#textwidth = 80

" let g:pencil#joinspaces = 0     " 0=one_space (def), 1=two_spaces following punctuation
let g:pencil#cursorwrap = 0     " 0=disable, 1=enable (def)


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
