" vim:fdm=marker

" 'reedes/vim-textobj-sentence' plugin integration {{{

augroup textobj_sentence
  autocmd!
  autocmd FileType markdown,mkd,rst,git,gitsendmail,*commit*,*COMMIT*,mail call textobj#sentence#init()
augroup END

" }}}

