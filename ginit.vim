set guifont="JetBrainsMono\ Nerd\ Font"
lua << EOF
require('nvim-web-devicons').setup {
	default = true
}
require('colorbuddy').colorscheme('zephyr')
require('ploog.indentGuide')
vim.cmd[[hi! CursorLine guibg=#323232 ]]
EOF
" hi LineNr guifg=#820000
" require('colorbuddy').colorscheme('modus-vivendi')
