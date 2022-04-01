
let g:coc_global_extensions = ['coc-html', 'coc-emmet', 'coc-clangd',
            \ 'coc-tsserver', 'coc-sh', 'coc-pyright', 'coc-json',
            \ 'coc-css', 'coc-calc' ]

" XXX: change to another location for portable mode
exec 'source '.fnameescape(g:initvim_folder."/plug.vim")
call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mhinz/vim-startify'
Plug 'voldikss/vim-floaterm'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()
autocmd CursorHold * silent call CocActionAsync('highlight')


lua require'colorizer'.setup()

nmap <Leader>rn <Plug>(coc-rename)
