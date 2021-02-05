" adapted/truncated from: <https://github.com/szw/vim-maximizer>

if exists('g:loaded_kp_maximizer')
	finish
endif
let g:loaded_kp_maximizer = 1

command! -bang -nargs=0 -range MaximizerToggle :call kp#maximizerToggle(<bang>0)

augroup maximizer
	au!
	au WinLeave * call kp#maximizerRestore()
augroup END
