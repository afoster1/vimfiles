" vim:fdm=marker

" UI configuration {{{

" Make gVim look more like vim.  Keep it simple!
:set guioptions+=c go-=m go-=T go-=l go-=L go-=r go-=R go-=b go-=F go-=e

" A running gvim will always have a window title, but when vim runs within
" an xterm, by default it inherits the terminal's current title.
set title

" The 'Press ENTER or type command to continue' prompt is annoying and easily
" avoided if the command-line text is shortened.
set shortmess=atI

" Change the behaviour of the "quickfix" windows so that <Return> to
" select an item uses an existing tab if it is already open, or a new tab if
" not
set switchbuf+=usetab,newtab

" }}}
