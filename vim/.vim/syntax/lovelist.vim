" Vim syntax file
" Language: Actionlist/Lovelist
" Maintainer: Actionless/Loveless
" Latest Revision: 2024

if exists("b:current_syntax")
  finish
endif

syn match headerSecondLevel '^\s*\~[^~]\+.*'
syn match headerSecondLevel '^\~\~[^~]\+.*'
hi def link headerSecondLevel PreProc

syn match headerFirstLevel '^\~[^~]\+.*'
hi def link headerFirstLevel Title

syn match listBullet '^\s*-\+'
hi def link listBullet Statement

syn match boldBullet '^\s*\*\+'
hi def link boldBullet Folded

syn match plusBullet '^\s*+'
hi def link plusBullet Added

syn match doneItem '^\s*[DXx]\s*-.*'
hi def link doneItem Conceal

syn match wipItem '^\s*[Ww]\s*-.*'
hi def link wipItem Type

syn match importantItem '^\s*!\s*-.*'
hi def link importantItem WarningMsg

syn match importanteItem '^\s*!!\s*-.*' skipwhite
syn match importanteItem '@TODO' skipwhite
hi def link importanteItem Todo

syn match importissimoItem '^\s*!!!\s*-.*' skipwhite
hi def link importissimoItem Error

syn match questionableItem '^\s*?\s*-.*'
syn match questionableItem '^\s*-\s*?.*'
hi def link questionableItem Statement

syn match decoration '^\~\~\~\~*'
syn match decoration '^--*'
syn match decoration '^____*'
hi def link decoration NonText

syn match Comment '^\s*#.*'
syn match Comment '#.*'  " not sure if this one is OK
