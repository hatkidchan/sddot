
let g:coc_global_extensions = ['coc-html', 'coc-emmet', 'coc-clangd',
            \ 'coc-tsserver', 'coc-sh', 'coc-pyright', 'coc-json',
            \ 'coc-css', 'coc-calc' ]

let g:plugins_dir='~/.local/share/nvim/plugged'
" INFO: change to 1 for portable mode on Windows
if 0
    " WARN: node should be installed here
    let $PATH.=';'.fnameescape(g:initvim_folder.'/node')
    " FIXME: not sure if that's a good idea...
    let $LOCALAPPDATA=fnameescape(g:initvim_folder."/localdata")
    let $HOMEPATH=$LOCALAPPDATA
    let $USERPROFILE=$HOMEPATH
    " WARN: you should create localdata/{coc,plugged} yourself :)
    let g:coc_data_home=fnameescape(g:initvim_folder.'/localdata/coc')
    let g:coc_config_home=fnameescape(g:initvim_folder.'/localdata/coc')
    let g:plugins_dir=fnameescape(g:initvim_folder.'/localdata/plugged')
endif
exec 'source '.fnameescape(g:initvim_folder."/plug.vim")
call plug#begin(g:plugins_dir)

Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mhinz/vim-startify'
Plug 'voldikss/vim-floaterm'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lewis6991/gitsigns.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'chentoast/marks.nvim'
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
