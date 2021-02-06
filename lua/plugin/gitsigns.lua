require('gitsigns').setup {
	signs = { --⎟
		add          = {hl = '', text = '〉', numhl='GitSignsAddNr'},
		change       = {hl = '', text = '⎨ ', numhl='GitSignsChangeNr'},
		delete       = {hl = '', text = '〈', numhl='GitSignsDeleteNr'},
		topdelete    = {hl = '', text = '◀︎ ', numhl='GitSignsDeleteNr'},
		changedelete = {hl = '', text = '∓ ', numhl='GitSignsChangeNr'},
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
		interval = 200
	},
	sign_priority = 6,
	status_formatter = nil, -- Use default
}