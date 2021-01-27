set guifont="JetBrainsMono\ Nerd\ Font"
lua << EOF
require('colorbuddy').colorscheme('zephyr')
require('nvim-web-devicons').setup {
	default = true
}
require('ploog.indentGuide')
EOF
" hi LineNr guifg=#820000
" require('colorbuddy').colorscheme('modus-vivendi')
