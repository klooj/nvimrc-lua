-- for snippets.nvim

require('plenary.reload').reload_module("nlua")
require('plenary.reload').reload_module("snippets")

local sp = require('snippets')
local snips = {}
local U = require('snippets.utils')
sp.debug(false)

local format = string.format
-- local path = require 'path'
-- local insert = table.insert

local function note_snippet(header)
  -- local S = [[$-1(kp, ${=snippet_date()}) ]]
  -- local S = [[$-1(kp): ]]
  -- Put a dummy value for -1 and add a default later.
  local S = [[
${-1}:
 $0
   - kp, ${=os.date()}]]
  S = U.force_comment(S)
  S = U.match_indentation(S)
  return U.iterate_variables_by_id(S, -1, function(v)
    v.default = header
  end)
end


--[[
          === LUA ===
]]
snips.lua = vim.tbl_deep_extend(
  "error",
  require('nlua.snippets').get_lua_snippets(),
  {
    get_parsed = [[local parv:match"([^.()]+)[()]*$"}} = require '$1']],
    rell = [[require('plenary.reload').reload_module('$1')$0]],
    ifel = U.match_indentation [[
if ${1:condition} then
  ${2:-- body}
else
  ${0:-- body}
end]],
    ["for"] = U.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
	$0
end]],
    fori = U.match_indentation [[
for ${1:i} = ${2:1}, ${3:#t} do
	$0
end]],
    forp = U.match_indentation [[
for ${1:k}, ${2:v} in pairs(${3:t}) do
	$0
end]],
    reqq = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']], -- slightly different than nlua version
    locc = "local $1 = $0",
    expp = "$1 = $1;",
    fld = [[
--{{{$1
$0
--}}}]],
    cmt = [[
                                                                            --[[
    $0
                                                                              \]\]
]],
    ["locall"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],  -- slightly different than nlua version
    prelude = U.match_indentation [[
local uv = require 'luv'
local format = string.format
local concat = table.concat
local insert = table.insert
]],
  }
)
--[[
      === LATEX ===
]]
  snips.latex = {
    gfx = [[
\begin{figure}[$1]
  \centering
  \includegraphics[${3:width=$2cm}]{$2}
  \caption{$4}
  \label{fig:$5}
\end{figure}
]]
  };
--[[
      === GLOBAL ===
]]
snips._global = {
  date = "${=os.date()}";
  ymd = [[${=os.date("%Y-%m-%d")}]];
  rs = [[${=RandomString(25)}]];
  uname = function() return vim.loop.os_uname().sysname end;
  todo      = note_snippet "TODO";
  note      = note_snippet "NOTE";
  idea      = note_snippet "IDEA";
  important = note_snippet "IMPORTANT";
  randcolor = function()
    return format("#%06X", math.floor(math.random() * 0xFFFFFF))
  end;
}

--[[
          === MARKDOWN ===
]]
--{{{markdown
snips.markdown = {
  ['cblock'] = [[

  ```$1
  $0

  ```

  ]]
}
--}}}

--[[
          === ZSH ===
]]
snips.zsh = {
  zzz = "#! /usr/bin/env zsh";
  fld = [[
# {{{$1
$0
# }}}]];
  cmt = [[
################################################################################
$0
################################################################################
]];
  ift = U.match_indentation [[
if [[ $1 \]\] {
  $0
}
]];
  ifel = U.match_indentation [[
if [[ $1 \]\] {
  $2
} else {
  $0
}
]];
  ifelif = U.match_indentation [[
if [[ $1 \]\] {
  $2
} else {
  $0
}
]];
-- case $OSTYPE in
--  *darwin*)
--    export OS_DISTRO=export OS_DISTRO=$(print $OSTYPE:gs/[0-9,.]//)
--    . $ZDOTS/env/osxrc.zsh
--   ;;

--  *linux*)
--   export OS_DISTRO=$(print ${$(lsb_release -d -s):l} | awk '{print  $1}')
--   . $ZDOTS/env/linuxrc.zsh
--   ;;
-- esac
  osd = '$OSTYPE =~ darwin';
  osl = '$OSTYPE =~ linux';
  osp = '$OSTYPE =~ linux';

}
-- if ${1:condition} then
--   ${2:-- body}
-- else
--   ${0:-- body}
-- end]],

snips.vim = {
  fld = [[
"{{{$1
$0
"}}}]];
  cmt = [[
" ==============================================================================
$0
" ==============================================================================
]];

}

sp.snippets = snips

-- ======================
-- snip_plug.snippets = snips
-- snip_plug.use_suggested_mappings()

-- -- require'snippets'.set_ux(require'snippets.inserters.floaty')
-- require'snippets'.set_ux(require'snippets.inserters.vim_input')
