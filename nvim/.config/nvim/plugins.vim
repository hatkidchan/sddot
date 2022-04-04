
let g:coc_global_extensions = ['coc-html', 'coc-emmet', 'coc-clangd',
            \ 'coc-tsserver', 'coc-sh', 'coc-pyright', 'coc-json',
            \ 'coc-css', 'coc-calc' ]

" INFO: change to another location for portable mode
exec 'source '.fnameescape(g:initvim_folder."/plug.vim")
call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mhinz/vim-startify'
Plug 'voldikss/vim-floaterm'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'chentau/marks.nvim'
Plug 'lewis6991/spellsitter.nvim'
Plug 'preservim/nerdcommenter'

call plug#end()
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:NERDDefaultAlign = 'left'

lua << EOF
require('colorizer').setup()
require('todo-comments').setup({ signs = false })
require('marks').setup({})
require('gitsigns').setup()
require('spellsitter').setup({ enable = true })
EOF

nmap <Leader>rn <Plug>(coc-rename)
