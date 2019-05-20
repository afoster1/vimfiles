" vim:fdm=marker

" 'vim-bookmarks' plugin integration {{{

let g:bookmark_sign = '->'
let g:bookmark_annotation_sign = '=>'
let g:bookmark_auto_save = 1
let g:bookmark_manage_per_buffer = 1
nmap <Leader>ab <Plug>BookmarkAnnotate
nmap <Leader>abx <Plug>BookmarkClearAll
nmap [ab <Plug>BookmarkPrev
nmap ]ab <Plug>BookmarkNext
nmap <F3> <Plug>BookmarkToggle
nmap <F4> <Plug>BookmarkNext
nmap <S-F4> <Plug>BookmarkPrev

" }}}
