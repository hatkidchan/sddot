" madeline - simple theme for myself
"
" Author:       hkc <hatkidchan@gmail.com>
" Repository:   https://github.com/hatkidchan/dotfiles
" Version:      1.0

set background=dark
let g:colors_name = "madeline"

if exists("g:neovide")
    let g:neovide_transparency=0.9
    let g:neovide_cursor_vfx_mode="pixiedust"
    set guifont=Unifont:h12
endif

hi ColorColumn      ctermfg=NONE    ctermbg=237     cterm=NONE
hi Cursor           ctermfg=234     ctermbg=4       cterm=NONE
hi CursorColumn     ctermfg=NONE    ctermbg=233     cterm=NONE
hi CursorLine       ctermfg=NONE    ctermbg=59      cterm=NONE
hi CursorLineNr     ctermfg=247     ctermbg=234     cterm=NONE
hi DiffAdd          ctermfg=NONE    ctermbg=22      cterm=bold
hi DiffChange       ctermfg=NONE    ctermbg=64      cterm=NONE
hi DiffDelete       ctermfg=52      ctermbg=52      cterm=NONE
hi DiffText         ctermfg=255     ctermbg=24      cterm=bold
hi Directory        ctermfg=179     ctermbg=NONE    cterm=NONE
hi ErrorMsg         ctermfg=255     ctermbg=167     cterm=NONE
hi FoldColumn       ctermfg=117     ctermbg=239     cterm=NONE
hi Folded           ctermfg=242     ctermbg=234     cterm=NONE
hi IncSearch        ctermfg=234     ctermbg=75      cterm=NONE
hi LineNr           ctermfg=243     ctermbg=235     cterm=NONE
hi MatchParen       ctermfg=NONE    ctermbg=NONE    cterm=underline
hi MoreMsg          ctermfg=150     ctermbg=NONE    cterm=NONE
hi NonText          ctermfg=240     ctermbg=NONE    cterm=NONE
hi Normal           ctermfg=255     ctermbg=NONE    cterm=NONE
hi NormalFloat      ctermfg=15      ctermbg=233     cterm=NONE
hi PMenu            ctermfg=15      ctermbg=233     cterm=NONE
hi Conceal          ctermbg=233     cterm=underline
hi PmenuSel         ctermfg=NONE    ctermbg=59      cterm=NONE
hi Question         ctermfg=150     ctermbg=NONE    cterm=NONE
hi Search           ctermfg=NONE    ctermbg=NONE    cterm=underline
hi SignColumn       ctermfg=NONE    ctermbg=237     cterm=NONE
hi StatusLine       ctermfg=253     ctermbg=239     cterm=bold
hi StatusLineNC     ctermfg=249     ctermbg=237     cterm=NONE
hi TabLine          ctermfg=240     ctermbg=0       cterm=NONE
hi TabLineSel       ctermfg=15      ctermbg=0       cterm=NONE
hi TabLineFill      ctermfg=NONE    ctermbg=0       cterm=NONE
hi Title            ctermfg=255     ctermbg=NONE    cterm=NONE
hi Underlined       ctermfg=NONE    ctermbg=NONE    cterm=underline
hi VertSplit        ctermfg=235     ctermbg=235     cterm=NONE
hi Visual           ctermfg=NONE    ctermbg=0       cterm=NONE
hi WarningMsg       ctermfg=255     ctermbg=167     cterm=NONE
hi WildMenu         ctermfg=234     ctermbg=215     cterm=NONE
hi NERDTreeUp       ctermfg=167     ctermbg=NONE    cterm=NONE
hi NERDTreeDir      ctermfg=251     ctermbg=NONE    cterm=bold
hi NERDTreeDirSlash ctermfg=251     ctermbg=NONE    cterm=NONE
hi NERDTreeFile     ctermfg=241     ctermbg=NONE    cterm=NONE
hi NERDTreeCWD      ctermfg=167     ctermbg=NONE    cterm=NONE
hi NERDTreeOpenable ctermfg=167     ctermbg=NONE    cterm=NONE
hi NERDTreeClosable ctermfg=167     ctermbg=NONE    cterm=NONE

" Syntax
hi Boolean          ctermfg=173     ctermbg=NONE    cterm=NONE
hi Character        ctermfg=140     ctermbg=NONE    cterm=NONE
hi Comment          ctermfg=240     ctermbg=NONE    cterm=NONE
hi Conditional      ctermfg=140     ctermbg=NONE    cterm=NONE
hi Constant         ctermfg=140     ctermbg=NONE    cterm=NONE
hi Define           ctermfg=140     ctermbg=NONE    cterm=NONE
hi Error            ctermfg=255     ctermbg=167     cterm=NONE
hi Float            ctermfg=140     ctermbg=NONE    cterm=NONE
hi Function         ctermfg=74      ctermbg=NONE    cterm=NONE
hi Identifier       ctermfg=255     ctermbg=NONE    cterm=NONE
hi Keyword          ctermfg=140     ctermbg=NONE    cterm=NONE
hi Label            ctermfg=186     ctermbg=NONE    cterm=NONE
hi Number           ctermfg=173     ctermbg=NONE    cterm=NONE
hi Operator         ctermfg=117     ctermbg=NONE    cterm=NONE
hi PreCondit        ctermfg=140     ctermbg=NONE    cterm=NONE
hi PreProc          ctermfg=140     ctermbg=NONE    cterm=NONE
hi Repeat           ctermfg=140     ctermbg=NONE    cterm=NONE
hi Special          ctermfg=117     ctermbg=NONE    cterm=NONE
hi SpecialComment   ctermfg=242     ctermbg=NONE    cterm=NONE
hi SpecialKey       ctermfg=59      ctermbg=237     cterm=NONE
hi SpellBad         ctermfg=255     ctermbg=167     cterm=NONE
hi SpellCap         ctermfg=255     ctermbg=74      cterm=NONE
hi SpellRare        ctermfg=255     ctermbg=140     cterm=NONE
hi SpellLocal       ctermfg=255     ctermbg=14      cterm=NONE
hi Statement        ctermfg=167     ctermbg=NONE    cterm=NONE
hi StorageClass     ctermfg=215     ctermbg=NONE    cterm=NONE
hi String           ctermfg=150     ctermbg=NONE    cterm=NONE
hi Structure        ctermfg=215     ctermbg=NONE    cterm=NONE
hi Tag              ctermfg=140     ctermbg=NONE    cterm=NONE
hi Todo             ctermfg=74      ctermbg=234     cterm=inverse
hi Type             ctermfg=140     ctermbg=NONE    cterm=NONE
hi vimTodo          ctermfg=162     ctermbg=51
