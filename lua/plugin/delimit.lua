local opts = {
  balance_matchpairs = 1,
  expand_cr = 2,
  expand_inside_quotes = 1,
  expand_space = 0,
  jump_expansion = 1,
  nesting_quotes = {'`'},
}

VG("delimitMate_", opts)

-- excluded_ft = {"mrkdown", "wiki"}
-- vg.loaded_delimitMate = 1 -- turn off plug
