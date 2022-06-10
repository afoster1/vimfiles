" vim:fdm=marker

" Tabs configuration {{{

" Helper functions
function! TabLeft()
    let tab_number = tabpagenr()
    if tab_number == 1
        execute "tabm" tabpagenr('$')
    else
        execute "tabm" tab_number - 2
    endif
endfunction

function! TabRight()
    let tab_number = tabpagenr()
    let last_tab_number = tabpagenr('$')
    if tab_number == last_tab_number
        execute "tabm" 0
    else
        execute "tabm" tab_number + 1
    endif
endfunction

" Keyboard Mappings
nmap <Leader>h :tabprevious<CR>
nmap <Leader>l :tabnext<CR>
nmap <Leader>j :execute TabLeft()<CR>
nmap <Leader>k :execute TabRight()<CR>
nmap <Leader>t :tabnew<CR>

" }}}
