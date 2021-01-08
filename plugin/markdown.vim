" this contains configuration for most markdown stuff.

" au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown syntax=markdown

" Turn spellcheck on for markdown files
" augroup auto_spellcheck
"   autocmd BufNewFile,BufRead *.md setlocal spell
" augroup END

" nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"       \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"       \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>


	" dependency for formatting tables: https://github.com/godlygeek/tabular


" toggle checkmark or make a box for one for each line in visual selection
function! CheckEmAll()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    call checkbox#ToggleCB()
  else
    '<,'>call checkbox#ToggleCB()
  endif
endfunction

"----- folding and layout -----
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_folding_level = 3
" let g:vim_markdown_toc_autofit = 1


" ---- following anchors and links -----
" follow named anchors in links of the form file#anchor or just #anchor, where file may
" omit the .md extension as usual, and omitting file allows jumping to the anchor.
let g:vim_markdown_follow_anchor = 1

" This expression will be evaluated substituting v:anchor with a quoted string that
" contains the anchor to visit. The result of the evaluation will become the real anchor
" to search in the target file. This is useful in order to convert anchors of the form,
" say, my-section-title to searches of the form My Section Title or <<my-section-title>>.
" Default is ''.
" let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"

" If you want to have a link like this [link text](link-url) and follow it for editing in
" vim using the ge command, but have it open the file "link-url.md" instead of the file
" "link-url"
" let g:vim_markdown_no_extensions_in_markdown = 1

" how to open the file
let g:vim_markdown_edit_url_in = 'vsplit' " Possible values are tab, vsplit, hsplit, current

" ----- Syntax and languages ------
" fenced code block languages; default is ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'].
" let g:vim_markdown_fenced_languages = ['csharp=cs']
let g:vim_markdown_math = 1 			" latex
let g:vim_markdown_frontmatter = 1 		" YAML front matter
let g:vim_markdown_toml_frontmatter = 1 " TOML front matter
let g:vim_markdown_json_frontmatter = 1 " JSON front matter


" highlight header markers

" ---- Text effects ----
let g:vim_markdown_conceal = 2
" let g:vim_markdown_strikethrough = 1 	" strikethrough
let g:vim_markdown_new_list_item_indent = 1
let g:vim_markdown_auto_insert_bullets = 1

" To disable math conceal with LaTeX math syntax enabled
let g:tex_conceal = ""

" Disable conceal for code blocks
let g:vim_markdown_conceal_code_blocks = 0


" ----- Key mapping ----
" let g:vim_markdown_no_default_key_mappings = 1
" open the link under the cursor in the same browser as the standard gx command.
" nnoremap gx <Plug>Markdown_OpenUrlUnderCursor

" ge: open the link under the cursor in Vim for editing. Useful for relative markdown links.
" nnoremap ge <Plug>Markdown_EditUrlUnderCursor

" ]]: go to next header.
" map <Plug>Markdown_MoveToNextHeader

" [[: go to previous header. Contrast with ]c.
" map <Plug>Markdown_MoveToPreviousHeader

" ][: go to next sibling header if any.
" map <Plug>Markdown_MoveToNextSiblingHeader

" []: go to previous sibling header if any.
" map <Plug>Markdown_MoveToPreviousSiblingHeader

" ]c: go to Current header.
" map <Plug>Markdown_MoveToCurHeader

" ]u: go to parent header (Up).
" map <Plug>Markdown_MoveToParentHeader

" ###########################################
