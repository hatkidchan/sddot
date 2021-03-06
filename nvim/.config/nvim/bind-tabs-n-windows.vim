" Splitting
nnoremap <Leader>sv :sp<CR>
nnoremap <Leader>-  :sp<CR>
nnoremap <Leader>sh :vs<CR>
nnoremap <Leader>\  :vs<CR>

" Tabs
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprev<CR>
nnoremap <Leader>tc :tabnew<CR>
nnoremap <Leader>t= <C-W>=
nnoremap <Leader>tm :sp<CR><C-W>T

" NERDTree
nnoremap <Leader>tr :NERDTreeToggle<CR>:NERDTreeRefreshRoot<CR>
nnoremap <F8> :NERDTreeToggle<CR>:NERDTreeRefreshRoot<CR>
inoremap <F8> <ESC>:NERDTreeToggle<CR>:NERDTreeRefreshRoot<CR>

" Moving
nnoremap <Leader><Up>       <C-W><Up>
nnoremap <Leader><Down>     <C-W><Down>
nnoremap <Leader><Left>     <C-W><Left>
nnoremap <Leader><Right>    <C-W><Right>
nnoremap <Leader>h          <C-W><Left>
nnoremap <Leader>j          <C-W><Down>
nnoremap <Leader>k          <C-W><Up>
nnoremap <Leader>l          <C-W><Right>

" Resizing
nnoremap <Leader><C-Up>     :res +2<CR>
nnoremap <Leader><C-Down>   :res -2<CR>
nnoremap <Leader><C-Left>   :vert res +2<CR>
nnoremap <Leader><C-Right>  :vert res -2<CR>
nnoremap <C-W><C-Up>        :res +2<CR>
nnoremap <C-W><C-Down>      :res -2<CR>
nnoremap <C-W><C-Left>      :vert res +2<CR>
nnoremap <C-W><C-Right>     :vert res -2<CR>

" Terminal
tnoremap <A-q> <C-\><C-n>
nnoremap <Leader>tt :FloatermToggle<CR>

" Shift+F9 ... Shift+F12
nnoremap <F21> :FloatermPrev<CR>
nnoremap <F22> :FloatermNext<CR>
nnoremap <F23> :FloatermNew<CR>
nnoremap <F24> :FloatermToggle<CR>
tnoremap <F21> <C-\><C-n>:FloatermPrev<CR>
tnoremap <F22> <C-\><C-n>:FloatermNext<CR>
tnoremap <F23> <C-\><C-n>:FloatermNew<CR>
tnoremap <F24> <C-\><C-n>:FloatermToggle<CR>
nnoremap <S-F9> :FloatermPrev<CR>
nnoremap <S-F10> :FloatermNext<CR>
nnoremap <S-F11> :FloatermNew<CR>
nnoremap <S-F12> :FloatermToggle<CR>
tnoremap <S-F9> <C-\><C-n>:FloatermPrev<CR>
tnoremap <S-F10> <C-\><C-n>:FloatermNext<CR>
tnoremap <S-F11> <C-\><C-n>:FloatermNew<CR>
tnoremap <S-F12> <C-\><C-n>:FloatermToggle<CR>

" Startify
nnoremap <Leader>st :Startify<CR>
