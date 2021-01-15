local opts = {
  disable_default_keybindings = 1,     -- Disable default any-jump keybindings (default: 0)
  list_numbers = 1,                    -- Show line numbers in search rusults
  references_enabled = 1,              -- Auto search references
  grouping_enabled = 1,                -- Auto group results by filename
  preview_lines_count = 5,             -- Amount of preview lines for each search result
  max_search_results = 10,             -- Max search results, other results can be opened via [a]
  search_prefered_engine = 'rg',       -- Prefered search engine: rg or ag
  results_ui_style = 'filename_first', -- Search results list styles: 'filename_first' | 'filename_last'
  remove_comments_from_results = 1,    -- Remove comments line from search results (default: 1)
  ignored_files = {'*.tmp', '*.temp'}, -- Custom ignore files; default is: ['*.tmp', '*.temp']
}

VG("any_jump_", opts)

-- for k,v in pairs(opts) do
  -- vg[.. k] = v
-- end


-- Search references only for current file type (default: false, so will find keyword in all filetypes)
-- vg.any_jump_references_only_for_current_filetype = 0

-- Disable search engine ignore vcs untracked files (default: false, search engine will ignore vcs untracked files)
-- vg.any_jump_disable_vcs_ignore = 0
