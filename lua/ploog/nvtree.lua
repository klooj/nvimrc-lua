local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- local get_lua_cb = function (cb_name)
  -- return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
-- end
local opts = {
	side = 'left',
	width = 15,
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
    ['-']     = tree_cb("dir_up"),
    ['<BS>']  = tree_cb("close_node"),
    ['<CR>']  = tree_cb("edit"),
    ['<Tab>'] = tree_cb("preview"),
    ['[c']    = tree_cb("prev_git_item"),
    [']c']    = tree_cb("next_git_item"),
    ['a']     = tree_cb("create"),
    ['c']     = tree_cb("copy"),
    ['d']     = tree_cb("remove"),
    ['h']     = tree_cb("split"),
    ['H']     = tree_cb("toggle_dotfiles"),
    ['I']     = tree_cb("toggle_ignored"),
    ['L']     = tree_cb("cd"),
    ['p']     = tree_cb("paste"),
    ['R']     = tree_cb("full_rename"),
    ['r']     = tree_cb("rename"),
    ['t']     = tree_cb("tabnew"),
    ['u']     = tree_cb("refresh"),
    ['v']     = tree_cb("vsplit"),
    ['x']     = tree_cb("cut"),
	}
}

VG("nvim_tree_", opts)

vim.cmd[[highlight NvimTreeFolderIcon guifg=peru]]

-- tree_cb("edit"),
-- tree_cb("edit"),
-- tree_cb("edit_vsplit"),
-- tree_cb("edit_split"),
-- tree_cb("edit_tab"),
-- tree_cb("toggle_ignored"),
-- tree_cb("toggle_dotfiles"),
-- tree_cb("refresh"),
-- tree_cb("preview"),
-- tree_cb("cd"),
-- tree_cb("create"),
-- tree_cb("remove"),
-- tree_cb("rename"),
-- tree_cb("cut"),
-- tree_cb("copy"),
-- tree_cb("paste"),
-- tree_cb("prev_git_item"),
-- tree_cb("next_git_item"),
