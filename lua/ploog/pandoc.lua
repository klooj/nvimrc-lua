-- modules
local pmods = {
  -- warn_disabled = 0,
  enabled = {
    'command',
    'folding',
    'formatting',
    'hypertext',
    'metadata',
    'menu',
    'toc',
    'yaml',
  },
    -- 'executors',
  disabled = {
    'bibliographies',
    'completion',
    'spell',
  },
}
VG('pandoc#modules#', pmods)


-- "after modules"
local pafter = {
  "ultisnip",
}
VG('pandoc#after#modules#enabled', pafter)

-- filetypes
local pft = {
  pandoc_markdown = 1,  -- set to 0 to opt out of markdown
  handled = {'pandoc', 'markdown', 'wiki'},
}
VG('pandoc#filetypes#', pft)


-- formatting options
local pformat = {
  mode = 'sa', -- h = hard,a = autoformat, A = smart autoformat (for hardwrap), s = soft
  textwidth = 80,
  -- equalprg = 'pandoc -t markdown [--columns {g:pandoc#formatting#textwidth}|--wrap=none]',
  -- extra_equalprg = '--reference-links',
  smart_autoformat_on_cursormoved = 0,
}
VG('pandoc#formatting#', pformat)


-- command options
local pcmd = {
  prefer_pdf = 1,
  -- autoexec_on_writes = 1,
  -- autoexec_command = 'Pandoc! pdf',
  -- use_message_buffers = 1,
  -- latex_engine = 'xelatex',
  -- path = 'pandoc',
  -- templates_file = 'vim.cmd.split(&runtimepath, ",")[0]."/vim-pandoc-templates"'
}
VG('pandoc#command#', pcmd)


-- key mappings
local pkbd = {
  -- enabled_submodules = {"checkboxes"},
  use_default_mappings = 0, --  ["lists", "references", "styles", "sections", "links", "checkboxes"]
  -- blacklist_submodule_mappings = {},
}
VG('pandoc#keyboard#', pkbd)
-- vim.g.'pandoc#keyboard#sections#header_style' = "atx"


-- TOC
local ptoc = {
  position = 'right',
  close_after_navigating = 0,
  shift = 1,
}
VG('pandoc#toc#', ptoc)


-- folding
local pfold = {
  fold_yaml = 1,
  level = 4,
  fold_fenced_codeblocks = 1,
}
VG('pandoc#folding#', pfold)


-- hypertext
local phype = {
  create_if_no_alternates_exists = 1,
  -- autosave_on_edit_open_link = 1,
  use_default_mappings = 1,
}
VG('pandoc#hypertext#', phype)

local pconceal = {
  use = 1,
  urls = 1,
}
VG('pandoc#syntax#conceal#', pconceal)
-------
-- To save the latest :Pandoc incantation as a template, the user should execute
--     :PandocTemplate save my_usual_article
-- It is also possible to save a custom incantation like this
--     :PandocTemplate save fancy_article pdf -Vdocumentclass=memoir -Vmainfont='Helvetica Neue'
-- To review some template, use
--     :PandocTemplate get my_usual_article
-- which should output the template definition.

 -- let g:pandoc#command#custom_open = "MyPandocOpen"
	-- function! MyPandocOpen(file)
		-- let file = shellescape(fnamemodify(a:file, ':p'))
		-- let file_extension = fnamemodify(a:file, ':e')
		-- if file_extension is? 'pdf'
			-- if !empty($PDFVIEWER)
				-- return expand('$PDFVIEWER') . ' ' . file
			-- elseif executable('zathura')
				-- return 'zathura ' . file
			-- elseif executable('mupdf')
				-- return 'mupdf ' . file
			-- endif
		-- elseif file_extension is? 'html'
			-- if !empty($BROWSER)
				-- return expand('$BROWSER') . ' ' . file
			-- elseif executable('firefox')
				-- return 'firefox ' . file
			-- elseif executable('chromium')
				-- return 'chromium ' . file
			-- endif
		-- elseif file_extension is? 'odt' && executable('okular')
			-- return 'okular ' . file
		-- elseif file_extension is? 'epub' && executable('okular')
			-- return 'okular ' . file
		-- else
			-- return 'xdg-open ' . file
		-- endif
	-- endfunction

-- g:pandoc#biblio#sources
--   default = "bcgy"
--   Where to look for bibliographies:
--     b: use files with the same name as the current file, in the working dir
--     c: use any bibliography in the working dir
--     l: look in pandoc's local dir
--     t: look in the local texmf tree
--     g: append items in |g:pandoc#biblio#bibs|
--     y: look in the current file's YAML header
