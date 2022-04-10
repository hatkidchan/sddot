set number relativenumber list title incsearch ruler
set expandtab autoindent tabstop=4 shiftwidth=4 
set mouse=a notimeout timeoutlen=2500 termguicolors
set encoding=utf-8 fileencoding=utf-8 colorcolumn=81

" Leaders
let maplocalleader="\<Space>"
let mapleader="\<Space>"

" Smooth scroll on touch devices
map <ScrollWheelUp> <C-Y>
imap <ScrollWheelUp> <C-X><C-Y>
map <ScrollWheelDown> <C-E>
imap <ScrollWheelDown> <C-X><C-E>

" Natural language
set keymap=russian-jcukenwin
lmap \| /
set iminsert=0
set imsearch=0
inoremap <A-Space> <C-^>

" Random stuff
set t_kB=[Z
set t_Co=256
syntax on


if (!has("patch-8.1.1365") || has("patch8.1.1365"))
    set nomodeline
else
    set modeline
endif

" Sourcing stuff
let g:initvim_folder = expand("<sfile>:p:h")
exec 'set runtimepath+='.fnameescape(g:initvim_folder)
colorscheme madeline

let g:langprefs_path = g:initvim_folder."/langprefs"
exec 'source '.fnameescape(g:initvim_folder."/bind-tabs-n-windows.vim")
exec 'source '.fnameescape(g:initvim_folder."/bind-edit.vim")
exec 'source '.fnameescape(g:initvim_folder."/plugins.vim")
exec 'source '.fnameescape(g:initvim_folder."/langprefs/load.vim")
exec 'source '.fnameescape(g:initvim_folder."/langprefs/run.vim")
exec 'source '.fnameescape(g:initvim_folder."/symbols.vim")


