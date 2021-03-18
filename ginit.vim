" set guifont=FiraCode\ Nerd\ Font
set fo=jnrl1c fo-=o sts=-1
lua << EOF
Snazz{
	theme = 'zephyr',
	pack = 'zephyr-nvim'
}
EOF
" require('colorbuddy').colorscheme('modus-vivendi')
" local set_theme = function()
" 	require('colorbuddy').colorscheme('zephyr')
" 	require('ploog.indentGuide')
" 	vim.cmd[[hi! CursorLine guibg=#323232 ]]
" 	vim.cmd[[hi! LineNr guifg=#824020]]
" end
