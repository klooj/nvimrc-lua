command! -nargs=+ -complete=command Pipetab call kp#Pipetab(<q-args>)
command! -nargs=+ -complete=command Pipesplit call kp#Pipesplit(<f-args>)
command! -nargs=* -bang RG call kp#RipgrepFzf(<q-args>, <bang>0)
command! Obsidian execute "silent !open 'obsidian://open?vault=info&file=" . expand('%:r') . "'"

command! PackerInstall packadd packer.nvim | lua require('domain.plugins').install()
command! PackerUpdate packadd packer.nvim | lua require('domain.plugins').update()
command! PackerSync packadd packer.nvim | lua require('domain.plugins').sync()
command! PackerClean packadd packer.nvim | lua require('domain.plugins').clean()
command! PackerCompile packadd packer.nvim | lua require('domain.plugins').compile()

command! -nargs=* Searchr call kp#searchr(<f-args>)

map <NOP> <Plug>(Prettier)

function GetHLinfo()
   echo ("hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">")
endfunction

nnoremap <leader><f1> :echo synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>
nnoremap <leader><f2> :call GetHLinfo()
nnoremap <leader><f3> :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<cr>
nnoremap <leader><f4> :exec 'syn list '.synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>

" nnoremap <leader><f2> :echo ("hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">")<cr>
