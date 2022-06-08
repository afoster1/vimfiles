" vim:fdm=marker

" NetRW plugin configuration {{{

" Hide dotfiles on load
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Setup some keymaps to activate inside netrw
function! NetrwMapping()
    " Create a file. (Note: 'd' already mapped to create a directory)
    nmap <buffer> f %:w<CR>:buffer #<CR>
endfunction

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

" }}}
