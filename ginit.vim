set guifont="JetBrainsMono\ Nerd\ Font"
packadd modus-theme-vim
lua << EOF
require('colorbuddy').colorscheme('modus-vivendi')
require('nvim-web-devicons').setup {
	default = true
}
EOF
