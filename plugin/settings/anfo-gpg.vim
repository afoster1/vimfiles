" vim:fdm=marker

" vim-gnupg plugin integration {{{

" Tell the GnuPG plugin to armor new files.
let g:GPGPreferArmor=1

" Tell the GnuPG plugin to sign new files.
let g:GPGPreferSign=1

" Include me as a preferred recipient.
let g:GPGDefaultRecipients=['Andrew Foster']

" Setup gpg Filetypes
augroup GnuPGExtra
    " Set extra file options.
    autocmd BufReadCmd,FileReadCmd *.\(gpg\|asc\|pgp\) call SetGPGOptions()
    " Automatically close unmodified files after inactivity.
    autocmd CursorHold *.\(gpg\|asc\|pgp\) quit
augroup END
function! SetGPGOptions()
    set viminfo=  " Ensure no writes occur to the .viminfo file.
    set noswapfile " Dont write any unencrypted data to the swap file.
    set updatetime=60000 " Set updatetime to 1 minute.
    set foldmethod=marker " Fold at markers.
    set foldclose=all " Automatically close all folds.
    set foldopen=insert " Only open folds with insert commands.
    set filetype=gpg " Identify this as a gpg filetype.
endfunction

" Enable safer clipboard use with encrypted files.
" Using the clipboard with the "* register leaves the copied text in the clipboard.
" Using the clipboard with the "+ register clears the clipboard when the
" owning application exists.
" Yank WORD to system clipboard in normal mode
nmap <leader>y "+yE
" Yank selection to system clipboard in visual mode
vmap <leader>y "+y

" }}}
