" Copy/paste
set clipboard+=unnamedplus
inoremap <S-Insert>     <ESC>"+gpa
nnoremap <S-Insert>     "+gP
vnoremap <S-Insert>     d"+gP
vnoremap <Leader>cp     "+y
nnoremap <Leader>cp     V"+y<ESC>
nnoremap <C-D> mzyyp`zj
inoremap <C-D> <ESC>mzyyp`zja
vnoremap <C-D> y`>p
nnoremap <Leader>XR :let @+=@"<CR>
nnoremap <Leader>XW :let @"=@+<CR>
nnoremap <silent> <Leader>mc :delmarks a-zA-Z0-9<CR>

" File saving
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>qq :q<CR>
nnoremap <Leader>QQ :q!<CR>
nnoremap <Leader>qa :qa<CR>
nnoremap <Leader>QA :qa!<CR>
nnoremap <Leader>xx :x<CR>
nnoremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>a

" Mouse
function! s:toggleMouse()
    if &mouse == "a"
        set mouse=
    else
        set mouse=a
    endif
endfunction
command! ToggleMouse call <SID>toggleMouse()
nnoremap <Leader>mt :ToggleMouse<CR>

" Search
vnoremap // y/\V<C-R>"<CR>
vnoremap /<Right> y/\V<C-R>"
vnoremap /v/ y/\v<C-R>"<CR>
vnoremap /v<Right> y/\v<C-R>"
nnoremap / /\v

" Completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Replace
nnoremap <Leader>re :%s///g<Left><Left><Left>
vnoremap <Leader>re y<esc>:%s/<C-R>"//g<Left><Left>

" Tabulation
inoremap <S-Tab> <C-D>
vnoremap < <gv
vnoremap > >gv
nnoremap <Leader>at mzggVG=`z

" Comments
imap <F20> <ESC><Space>c<Space>a
nmap <F20> <Space>c<Space>
vmap <F20> <Space>c<Space>gv
imap <S-F8> <ESC><Space>c<Space>a
nmap <S-F8> <Space>c<Space>
vmap <S-F8> <Space>c<Space>gv

" Space characters
nnoremap <Leader>St :set listchars=tab:┊\ <cr>
nnoremap <Leader>Ss :set listchars=tab:\\\|-,eol:$,nbsp:%,space:_,trail:#<cr>
nnoremap <Leader>Sn :set listchars=<cr>
inoremap <C-L>n <esc>:set listchars=tab:┊\ <cr>a
inoremap <C-L>s <esc>:set listchars=tab:\\\|-,eol:$,nbsp:%,space:_,trail:#<cr>a
inoremap <C-L>h <esc>:set listchars=<cr>a

" Movement
nnoremap <S-Home> gg
nnoremap <S-End> G
inoremap <S-Home> <esc>gga
inoremap <S-End> <esc>Ga
