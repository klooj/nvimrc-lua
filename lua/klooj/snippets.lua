require('plenary.reload').reload_module("nlua")
require('plenary.reload').reload_module("snippets")
-- local snip_plug = require('snippets')
local indent = require('snippets.utils').match_indentation

-- ===

local sp = require('snippets')
-- near the end: sp.snippets = snips
local snips = {}
local U = require('snippets.utils')
sp.debug(false)

local path = require 'path'
local format = string.format
local insert = table.insert


-----------------------------
-- local cmt = require('snippets.utils').force_comment


-- {{{ lua
snips.lua = vim.tbl_deep_extend(
  "error";
  require('nlua.snippets').get_lua_snippets();
  {
    get_parsed = [[local parsed = get_parsed($1)]];
    reqq = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']];
    rell = [[require('plenary.reload').reload_module('$1')$0]];
    forr = U.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
	$0
end]];
    fori = U.match_indentation [[
for ${1:i} = ${2:1}, ${3:#t} do
	$0
end]];
    forp = U.match_indentation [[
for ${1:k}, ${2:v} in pairs(${3:t}) do
	$0
end]];

    fun = [[function${1|vim.trim(S.v):gsub("^%S";" %0")}(${2|vim.trim(S.v)})$0 end]];
    ["loc"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]];
    ["for"] = indent [[
      for ${1:i}, ${2:v} in ipairs(${3:t}) do
        $0
      end]];
  }
)
-- }}}
--{{{markdown
snips.markdown = {
  ['cblock'] = [[

  ```$1
  $0

  ```

  ]]
}
--}}}


snips._global = {
  ["todo"] = "TODO(kp): ";
  ["date"] = [[${=os.date("%Y-%m-%d")}]];
  ["rs"] = [[${=RandomString(25)}]];
  ["zzz"] = "#! /usr/bin/env zsh";
  ["fdl"] = [[
--{{{$1
$0
--}}}]];
  ["fdv"] = [[
"{{{$1
$0
"}}}]];
  ["fdz"] = [[
# {{{$1
$0
# }}}]];

  ["date"] = [[${=os.date("%Y-%m-%d")}]];
  ['uname'] = function() return vim.loop.os_uname().sysname end;
  ["rs"] = [[${=RandomString(25)}]];
}


-- ======================
snip_plug.snippets = snips
snip_plug.use_suggested_mappings()

-- require'snippets'.set_ux(require'snippets.inserters.floaty')
require'snippets'.set_ux(require'snippets.inserters.vim_input')
