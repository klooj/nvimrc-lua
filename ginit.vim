set guifont="JetBrainsMono\ Nerd\ Font"
packadd modus-theme-vim
packadd zephyr-nvim
lua << EOF
require('colorbuddy').colorscheme('zephyr')
require('nvim-web-devicons').setup {
	default = true
}
EOF
hi LineNr guifg=#820000
" require('colorbuddy').colorscheme('modus-vivendi')
