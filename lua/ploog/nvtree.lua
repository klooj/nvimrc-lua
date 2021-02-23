local get_lua_cb = function (cb_name)
  return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end
local opts = {
	side = 'left',
	width = 15,
	ignore = { '.git', 'node_modules', '.cache', '*.zwc*', '.old', '.DS_Store' },
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
    ['<CR>']  = get_lua_cb("edit"),
    ['o']     = get_lua_cb("edit"),
    ['v']     = get_lua_cb("edit_vsplit"),
    ['h']     = get_lua_cb("edit_split"),
    ['t']     = get_lua_cb("edit_tab"),
    ['I']     = get_lua_cb("toggle_ignored"),
    ['H']     = get_lua_cb("toggle_dotfiles"),
    ['R']     = get_lua_cb("refresh"),
    ['<Tab>'] = get_lua_cb("preview"),
    ['L']     = get_lua_cb("cd"),
    ['a']     = get_lua_cb("create"),
    ['d']     = get_lua_cb("remove"),
    ['r']     = get_lua_cb("rename"),
    ['x']     = get_lua_cb("cut"),
    ['c']     = get_lua_cb("copy"),
    ['p']     = get_lua_cb("paste"),
    ['[c']    = get_lua_cb("prev_git_item"),
    [']c']    = get_lua_cb("next_git_item"),
	}
}

VG("nvim_tree_", opts)

vim.cmd[[highlight NvimTreeFolderIcon guifg=peru]]

-- get_lua_cb("edit"),
-- get_lua_cb("edit"),
-- get_lua_cb("edit_vsplit"),
-- get_lua_cb("edit_split"),
-- get_lua_cb("edit_tab"),
-- get_lua_cb("toggle_ignored"),
-- get_lua_cb("toggle_dotfiles"),
-- get_lua_cb("refresh"),
-- get_lua_cb("preview"),
-- get_lua_cb("cd"),
-- get_lua_cb("create"),
-- get_lua_cb("remove"),
-- get_lua_cb("rename"),
-- get_lua_cb("cut"),
-- get_lua_cb("copy"),
-- get_lua_cb("paste"),
-- get_lua_cb("prev_git_item"),
-- get_lua_cb("next_git_item"),
