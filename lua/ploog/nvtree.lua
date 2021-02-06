local opts = {
	side = 'left',
	width = 25,
	ignore = { '.git', 'node_modules', '.cache', '.zwc', '.old', '.DS_Store' },
	auto_open = 0,
	auto_close = 0,
	quit_on_open = 0,
	follow = 1,
	indent_markers = 1,
	hide_dotfiles = 0,
	git_hl = 1,
	root_folder_modifier = ':~',
	tab_open = 0,
	width_allow_resize = 1,
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
	},
	icons = {
		default =  '',
		symlink =  '',
		git =  {
			unstaged = "✗",
			staged = "✓",
			unmerged = "",
			renamed = "➜",
			untracked = "¿",
		},
		folder =  {
			default =  "",
			open =  "",
			symlink = "",
		}
	},

	bindings = {
		edit            = {'<CR>', 'o'},
		edit_vsplit     = 'v',
		edit_split      = 'h',
		edit_tab        = 't',
		toggle_ignored  = 'I',
		toggle_dotfiles = 'H',
		refresh         = 'R',
		preview         = '<Tab>',
		cd              = 'L',
		create          = 'a',
		remove          = 'd',
		rename          = 'r',
		cut             = 'x',
		copy            = 'c',
		paste           = 'p',
		prev_git_item   = '[c',
		next_git_item   = ']c',
	}
}

VG("nvim_tree_", opts)

vim.cmd[[highlight NvimTreeFolderIcon guifg=peru]]
