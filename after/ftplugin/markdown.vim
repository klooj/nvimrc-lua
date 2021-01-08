" setl formatlistpat=^\\s*\\d\\+[.\)]\\s\\+\\\|^\\s*[*+~-]\\s\\+\\\|^\\(\\\|[*#]\\)\\[^[^\\]]\\+\\]:\\s
" setl comments =n:>
" setl fo+=cn tw=80 ts=2 sts=2 sw=2 expandtab
let b:delimitMate_nesting_quotes = ['`']

" softwrap markdown to the window width; just manually do a hard wrap when finished. maybe use a git hook.
" also, use a 1 char wide hanging indent for wrapped lines. last showbreak character (never works)
" setlocal wrap breakindent ts=2 sts=2 sw=2 expandtab briopt=shift:1,sbr
" --------------


" this clears highlighting from a search if present, otherwise it turns the text
" under the cursor into a wiki link; that link will be placed in the global wiki
" index if there is not one in a parent directory. finally, if there's no
" highlighting to clear and the cursor is already on a link, it will follow and
" open the file.
" nmap <buffer> <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "<plug>(wiki-link-open)"}()


augroup mdlintonsave
  au!
  au BufWritePost *.md silent !markdownlint -f <afile> &>/dev/null
augroup end



"========================

  " autocmd BufWritePre *.md,*.wiki exe '!markdownlint -f %:p >&/dev/null'
" lint save
" !markdownlint -f %:p >&/dev/null

" nmap <buffer> <expr> <CR> <plug>(wiki-link-open)
" nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : ":call <plug>(wiki-link-open)<CR>"}()
