set guifont="JetBrainsMono\ Nerd\ Font"
lua << EOF
local set_theme = function()
	require('nvim-web-devicons').setup {
		default = true
	}
	require('colorbuddy').colorscheme('zephyr')
	require('ploog.indentGuide')
	vim.cmd[[hi! CursorLine guibg=#323232 ]]
	vim.cmd[[hi! LineNr guifg=#824020]]
end
set_theme()
EOF
" require('colorbuddy').colorscheme('modus-vivendi')
