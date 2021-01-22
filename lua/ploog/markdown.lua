local opts = {
  auto_insert_bullets = 1,
  conceal = 2,
  conceal_code_blocks = 0,
  edit_url_in = 'vsplit',
  emphasis_multiline = 0,
  folding_disabled = 1,
  folding_level = 3,
  follow_anchor = 1,
  frontmatter = 1,
  json_frontmatter = 1,
  markdown_autowrite = 1,
  math = 1,
  -- new_list_item_indent = 1,
  toc_autofit = 1,
  toml_frontmatter = 1,

}

VG("vim_markdown_", opts)
vim.g.tex_conceal = ""

------------------

--  let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"

-- If you want to have a link like this [link text](link-url) and follow it for editing in
-- vim using the ge command, but have it open the file "link-url.md" instead of the file
-- "link-url"
-- let g:vim_markdown_no_extensions_in_markdown = 1
