function! ExecuteCurrentFile()
    let file_wd = expand('%:p:h')
    let file_name = expand('%:t')
    echom "Running ".file_name
    if &filetype == 'python'
      exec 'FloatermNew --autoclose=0 cd '.fnameescape(file_wd).'; '
            \ . 'python3 '.fnameescape(file_name)
    elseif &filetype == 'c'
      let exec_name = expand('%:t:r')
      exec 'FloatermNew --autoclose=0 cd ' . fnameescape(file_wd) . '; '
            \ . 'cc -o '.fnameescape(exec_name).' '.fnameescape(file_name)
            \ . ' && '
            \ . 'LIBGL_ALWAYS_SOFTWARE=1 ./'.fnameescape(exec_name)
    elseif &filetype == 'vim'
      exec 'source '.expand('%')
    else
      echohl ErrorMsg
      echom "Unknown file type"
      echohl None
    endif
endfunction

nnoremap <F12> :w<CR>:call ExecuteCurrentFile()<CR>
inoremap <F12> <ESC>:w<CR>:call ExecuteCurrentFile()<CR>a
