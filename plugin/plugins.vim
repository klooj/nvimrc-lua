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
map <Plug>(Prettier) <NOP>
" map <Plug> <Plug>(mkdx-unindent)
" map <Plug> <Plug>(mkdx-indent)
