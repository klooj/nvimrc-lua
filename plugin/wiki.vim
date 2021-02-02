function! MyWlinkNamer(text) abort
	return substitute(tolower(a:text), '\s\+', '-', 'g')
endfunction

let g:wiki_tags_format_pattern = '\v%(^|\s)#\zs[^# ]+'
let g:wiki_map_link_create ='MyWlinkNamer'

function! MyWikiFileOpen(...) abort dict
	if self.path =~# 'pdf$'
		silent execute '!open' fnameescape(self.path) '&'
		return 1
	endif

	return 0
endfunction
let g:wiki_file_open = 'MyWikiFileOpen'
let g:wiki_viewer = {
			\ '_' : 'open',
			\}


" function MyToggleWiki(url, text) abort dict
" 	return wiki#link#md#template(a:url . '.wiki',
" 				\ empty(a:text) ? a:url : a:text)
" endfunction

" function MyToggleMd(url, text) abort dict
" 	let l:url =substitute(a:url, '\.wiki$', '', '')
" 	return wiki#link#wiki#template(l:url, a:text)
" endfunction

" let g:wiki_link_toggles ={
" 			\ 'md': 'MyToggleMd',
" 			\ 'wiki': 'MyToggleWiki',
" 			\ 'date': 'wiki#link#wiki#template',
" 			\ 'shortcite': 'wiki#link#md#template',
" 			\ 'url': 'wiki#link#md#template',
" 			\}

let g:wiki_mappings_global = {
			\ '<plug>(wiki-fzf-pages)'       : '<leader>w/'        ,
			\ '<plug>(wiki-fzf-tags)'        : '<leader>w?'        ,
			\ '<plug>(wiki-index)'           : '<leader>wi'        ,
			\ '<plug>(wiki-journal)'         : '<leader>wj'        ,
			\ '<plug>(wiki-journal-index)'   : '<leader>wJ'        ,
			\ '<plug>(wiki-link-open)'       : '<leader><cr>'      ,
			\ '<plug>(wiki-link-open-split)' : '<localleader><cr>' ,
			\ '<plug>(wiki-open)'            : '<leader>wW'        ,
			\ '<plug>(wiki-reload)'          : '<leader>wR'        ,
			\ }

let g:wiki_mappings_local = {
			\ '<plug>(wiki-export)'               : '<leader>we' ,
			\ '<plug>(wiki-fzf-toc)'              : '<leader>w\' ,
			\ '<plug>(wiki-graph-find-backlinks)' : '<leader>wb' ,
			\ '<plug>(wiki-graph-in)'             : '<leader>wg' ,
			\ '<plug>(wiki-graph-out)'            : '<leader>wG' ,
			\ '<plug>(wiki-journal-copy-tonext)'  : '<leader>wP' ,
			\ '<plug>(wiki-journal-next)'         : '<S-Down>'   ,
			\ '<plug>(wiki-journal-prev)'         : '<S-Up>'     ,
			\ '<plug>(wiki-journal-tomonth)'      : '<leader>wS' ,
			\ '<plug>(wiki-journal-toweek)'       : '<leader>ws' ,
			\ '<plug>(wiki-link-next)'            : '<S-Right>'  ,
			\ '<plug>(wiki-link-open)'            : '<leader>ww' ,
			\ '<plug>(wiki-link-open-split)'      : '<leader>wv' ,
			\ '<plug>(wiki-link-prev)'            : '<S-Left>'   ,
			\ '<plug>(wiki-link-return)'          : '<bs>'       ,
			\ '<plug>(wiki-link-toggle)'          : '<leader>wl' ,
			\ '<plug>(wiki-link-toggle-operator)' : 'gL'         ,
			\ '<plug>(wiki-list-movedown)'        : '<M-Down>'   ,
			\ '<plug>(wiki-list-moveup)'          : '<M-Up>'     ,
			\ '<plug>(wiki-list-toggle)'          : '<c-s>'      ,
			\ '<plug>(wiki-list-uniq)'            : '<leader>wU' ,
			\ '<plug>(wiki-list-uniq-local)'      : '<leader>wu' ,
			\ '<plug>(wiki-page-delete)'          : '<leader>wD' ,
			\ '<plug>(wiki-page-rename)'          : '<leader>wr' ,
			\ '<plug>(wiki-page-toc)'             : '<leader>wC' ,
			\ '<plug>(wiki-page-toc-local)'       : '<leader>wc' ,
			\ '<plug>(wiki-tag-list)'             : '<leader>wt' ,
			\ '<plug>(wiki-tag-reload)'           : '<leader>wT' ,
			\ 'i_<plug>(wiki-list-toggle)'        : '<c-s>'      ,
			\ 'o_<plug>(wiki-al)'                 : 'al'         ,
			\ 'o_<plug>(wiki-at)'                 : 'at'         ,
			\ 'o_<plug>(wiki-au)'                 : 'au'         ,
			\ 'o_<plug>(wiki-il)'                 : 'il'         ,
			\ 'o_<plug>(wiki-it)'                 : 'it'         ,
			\ 'o_<plug>(wiki-iu)'                 : 'iu'         ,
			\ 'x_<plug>(wiki-al)'                 : 'al'         ,
			\ 'x_<plug>(wiki-at)'                 : 'at'         ,
			\ 'x_<plug>(wiki-au)'                 : 'au'         ,
			\ 'x_<plug>(wiki-export)'             : '<leader>we' ,
			\ 'x_<plug>(wiki-il)'                 : 'il'         ,
			\ 'x_<plug>(wiki-it)'                 : 'it'         ,
			\ 'x_<plug>(wiki-iu)'                 : 'iu'         ,
			\ 'x_<plug>(wiki-link-toggle-visual)' : '<leader>wl' ,
			\ }
