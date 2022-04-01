au BufNewFile,BufRead,BufEnter *.py 
            \ exec 'source '.fnameescape(g:langprefs_path."/python.vim")
au BufNewFile,BufRead,BufEnter *.c 
            \ exec 'source '.fnameescape(g:langprefs_path."/clang.vim")
au BufNewFile,BufRead,BufEnter *.{html,css,js,ts,php}
            \ exec 'source '.fnameescape(g:langprefs_path."/web.vim")
au BufNewFile,BufRead,BufEnter *.{tex,ltx}
            \ exec 'source '.fnameescape(g:langprefs_path."/tex.vim")

