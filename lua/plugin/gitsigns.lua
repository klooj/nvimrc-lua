require('gitsigns').setup {
	signs = { --⎟
		add          = {hl = 'diffAdded', text = '〉', numhl='GitSignsAddNr'},
		change       = {hl = 'diffChanged', text = '⎨ ', numhl='GitSignsChangeNr'},
		delete       = {hl = 'diffRemoved', text = '〈', numhl='GitSignsDeleteNr'},
		topdelete    = {hl = 'diffRemoved', text = '◀︎ ', numhl='GitSignsDeleteNr'},
		changedelete = {hl = 'diffIndexLine', text = '∓ ', numhl='GitSignsChangeNr'},
	},
	numhl = false,
	keymaps = {
		-- Default keymap options
		noremap = true,
		buffer = true,
		['n <leader>g]'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
		['n <leader>g['] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},
		-- Text objects
		['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
		['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>'
	},
	watch_index = {
		interval = 500
	},
	sign_priority = 1,
	status_formatter = nil, -- Use default
}
