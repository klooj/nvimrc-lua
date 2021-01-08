require('plenary.reload').reload_module("nlua")
require('plenary.reload').reload_module("snippets")
-- require('snippets').use_suggested_mappings()

local snip_plug = require('snippets')
-- local U = require('snippets.utils')
local indent = require('snippets.utils').match_indentation
-- local cmt = require('snippets.utils').force_comment

local snips = {}

snips._global = {
  ["todo"] = "TODO(kp): ",
  ["date"] = [[${=os.date("%Y-%m-%d")}]],
  ["rs"] = [[${=RandomString(25)}]],
  ["zzz"] = "#! /usr/bin/env zsh",
  ["fdl"] = [[
--{{{$1
$0
--}}}]],
  ["fdv"] = [[
"{{{$1
$0
"}}}]],
  ["fdz"] = [[
# {{{$1
$0
# }}}]],

  ["date"] = [[${=os.date("%Y-%m-%d")}]],
  ['uname'] = function() return vim.loop.os_uname().sysname end,
  ["rs"] = [[${=RandomString(25)}]],
}

--{{{markdown
snips.markdown = {
  ['cblock'] = [[

  ```$1
  $0

  ```

  ]]
}
--}}}
-- {{{ lua
snips.lua = vim.tbl_deep_extend(
  "error",
  require('nlua.snippets').get_lua_snippets(),
  {
    -- Custom parsed item, for a plugin I use a lot.
    get_parsed = [[local parsed = get_parsed($1)]],
    requ = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
    reload = [[require('plenary.reload').reload_module('$1')$0]],
    fun = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
    ["loc"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],
    ["for"] = indent [[
      for ${1:i}, ${2:v} in ipairs(${3:t}) do
        $0
      end]],
  }
)
-- }}}
-- {{{ json
snips.json = {
  testEntry = [[, {"text": "$1"}]],
  i = [["$1": "$2"]],
  e = [[, {"text": "$1: ${=RandomString(25)}", "score": $1}]],
}
-- }}}
-- {{{go
snips.go = {}
snips.go.err = indent [[
if err != nil {
  return$0
}]]
--}}}

snip_plug.snippets = snips
snip_plug.use_suggested_mappings()

-- require'snippets'.set_ux(require'snippets.inserters.floaty')
require'snippets'.set_ux(require'snippets.inserters.vim_input')


local charset = {}
do -- [0-9a-zA-Z]
    -- for c = 48, 57  do table.insert(charset, string.char(c)) end
    for c = 65, 90  do table.insert(charset, string.char(c)) end
    for c = 97, 122 do table.insert(charset, string.char(c)) end
    table.insert(charset, " ")
    table.insert(charset, " ")
    table.insert(charset, " ")
    table.insert(charset, " ")
    table.insert(charset, " ")
    table.insert(charset, " ")
end

function RandomString(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.clock()^5)
    return RandomString(length - 1) .. charset[math.random(1, #charset)]
end

--[[
-- Leftover from stream
-- function ExampleForMccannch()
--   vim.fn.complete(vim.fn.col('.'), { "hello", "world", "Tj is a nice streamer", "TJ is a helpful streamer" })
--   return ''
-- end
-- vim.cmd [[inoremap <c-x><c-m> <C-R>=v:lua.ExampleForMccannch()<CR>]]
-- vim.cmd [[inoremap <c-x><c-m> <C-R>=luaeval('require("my.plugin").thing()')<CR>]]
--]]
