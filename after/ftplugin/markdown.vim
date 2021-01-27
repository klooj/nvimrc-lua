" this is messy

let b:delimitMate_nesting_quotes = ['`']

augroup mdlintonsave
	au!
	au BufWritePost *.md silent !markdownlint -f <afile> &>/dev/null
augroup end


" nmap <buffer> <leader>mO :Obsidian<CR>


fun! s:MkdxGoToHeader(header)
	" given a line: '  84: # Header'
	" this will match the number 84 and move the cursor to the start of that line
	call cursor(str2nr(get(matchlist(a:header, ' *\([0-9]\+\)'), 1, '')), 1)
endfun

fun! s:MkdxFormatHeader(key, val)
	let text = get(a:val, 'text', '')
	let lnum = get(a:val, 'lnum', '')

	" if the text is empty or no lnum is present, return the empty string
	if (empty(text) || empty(lnum)) | return text | endif

	" We can't jump to it if we dont know the line number so that must be present in the outpt line.
	" We also add extra padding up to 4 digits, so I hope your markdown files don't grow beyond 99.9k lines ;)
	return repeat(' ', 4 - strlen(lnum)) . lnum . ': ' . text
endfun

fun! s:MkdxFzfQuickfixHeaders()
	" passing 0 to mkdx#QuickfixHeaders causes it to return the list instead of opening the quickfix list
	" this allows you to create a 'source' for fzf.
	" first we map each item (formatted for quickfix use) using the function MkdxFormatHeader()
	" then, we strip out any remaining empty headers.
	let headers = filter(map(mkdx#QuickfixHeaders(0), function('<SID>MkdxFormatHeader')), 'v:val != ""')

	" run the fzf function with the formatted data and as a 'sink' (action to execute on selected entry)
	" supply the MkdxGoToHeader() function which will parse the line, extract the line number and move the cursor to it.
	call fzf#run(fzf#wrap(
				\ {'source': headers, 'sink': function('<SID>MkdxGoToHeader') }
				\ ))
endfun

" finally, map it -- in this case, I mapped it to overwrite the default action for toggling quickfix (<PREFIX>I)
nnoremap <buffer><silent> <Leader>mI :call <SID>MkdxFzfQuickfixHeaders()<Cr>

"========================
" setl formatlistpat=^\\s*\\d\\+[.\)]\\s\\+\\\|^\\s*[*+~-]\\s\\+\\\|^\\(\\\|[*#]\\)\\[^[^\\]]\\+\\]:\\s
" setl comments =n:>
" setl fo+=cn tw=80 ts=2 sts=2 sw=2 expandtab

" softwrap markdown to the window width; just manually do a hard wrap when finished. maybe use a git hook.
" also, use a 1 char wide hanging indent for wrapped lines. last showbreak character (never works)
" setlocal wrap breakindent ts=2 sts=2 sw=2 expandtab briopt=shift:1,sbr
" --------------


" this clears highlighting from a search if present, otherwise it turns the text
" under the cursor into a wiki link; that link will be placed in the global wiki
" index if there is not one in a parent directory. finally, if there's no
" highlighting to clear and the cursor is already on a link, it will follow and
" open the file.
" tok care of this somewhere else
" nmap <buffer> <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "<plug>(wiki-link-open)"}()


" <Plug>(mkdx-ctrl-n-compl)
" <Plug>(mkdx-ctrl-p-compl)


" let g:mkdx#settings.map.prefix = '<localleader>'


" augroup mdWhichKey
" 	au!
" 	au BufEnter *.md lua require('klooj.md_keymaps')
" augroup end

" autocmd BufWritePre *.md,*.wiki exe '!markdownlint -f %:p >&/dev/null'
" lint save
" !markdownlint -f %:p >&/dev/null

" nmap <buffer> <expr> <CR> <plug>(wiki-link-open)

" let g:marked_app = 'Marked'
" nmap <buffer> <leader>mpo :MarkedOpen!<CR>
" nmap <buffer> <leader>mpq :MarkedQuit<CR>
" nmap <buffer> <leader>mpt :MarkedToggle<CR>
" imap <buffer><silent> <M-o> <Plug>(mkdx-enter)
" imap <buffer><silent> <S-M-o> <Plug>(mkdx-shift-enter)

" nmap <buffer><silent> <M-o> <Plug>(mkdx-o)
" nmap <buffer><silent> <S-M-o> <Plug>(mkdx-shift-o)
" nnoremap <buffer> <leader>mx <Plug>(mkdx-checkbox-next-n)
" vnoremap <buffer> <leader>mx <Plug>(mkdx-checkbox-next-v)
