set fo=j,n,q,r fo-=c fo-=o fo-=a fo-=t tw=120 ts=2 sts=2 sw=2 expandtab

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setlocal com=:--
setlocal cms=--%s
setlocal suffixesadd=.lua


let &cpo = s:cpo_save
unlet s:cpo_save

let b:undo_ftplugin = "setlocal fo< com< cms< suffixesadd<"
