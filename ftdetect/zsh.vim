augroup zshDetect
	au!
	au BufNewFile,BufRead .zshrc,.zshenv,.zlogin,.zlogout,.zcompdump,.zprofile setf zsh
	au BufNewfile,BufRead *.zsh setf zsh
augroup END
