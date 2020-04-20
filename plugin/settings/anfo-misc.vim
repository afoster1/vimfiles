" vim:fdm=marker

" General vim configuration {{{

" Disable modeline (security hazard)
set modelines=0
set nomodeline

" Setup tab widths correctly. etc.
:set expandtab
:set shiftwidth=4
:set softtabstop=4
:set tabstop=4
:set smarttab autoindent
:set cindent
:set ignorecase
:set smartcase

" Swap files and backups are annoying but can save you a lot of trouble.
" Rather than spread them all around your filesystem, isolate them to a single
" directory.
set backupdir=~/tmp
set directory=~/tmp

" These two options, when set together, will make /-style searches
" case-sensitive only if there is a capital letter in the search expression.
" *-style searches continue to be consistently case-sensitive.
set ignorecase
set smartcase

" By default, pressing <TAB> in command mode will choose the first possible
" completion with no indication of how many others there might be.
" To have the completion behave similarly to a shell, i.e. complete only up
" to the point of ambiguity (while still showing you what your options
" are), also add the following:
set wildmode=list:longest,full

" Intuitive backspacing in insert mode.
set backspace=indent,eol,start

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have to turn on yourself, or
" just set them all to be sure
syntax enable
filetype on
filetype plugin on
filetype indent on

" Don't show the matched highlight search terms, by default.
set nohlsearch
set incsearch

" Vim is a little surly, beeping at you at every chance. You can either
" find a way to turn off the bell completely, or more usefully, make the bell
" visual.
set visualbell

" Intuitive backspacing in insert mode.
set backspace=indent,eol,start

" The following will make tabs and trailing spaces visible when requested.
set listchars=tab:>-,trail:.,eol:$
nmap <silent> <leader><CR> :set nolist!<CR>

" Enable changing the current local directory to that of the current file.
:nnoremap <leader>cd :cd %:p:h:gs/ /\\ /<CR>

" Support yanking the current buffers filename to the clipboard register.
nmap <Leader>af :let @*=expand("%")<CR>
nmap <Leader>AF :let @*=expand("%:p")<CR>
nmap <Leader>ap :let @*=expand("%:h")<CR>
nmap <Leader>AP :let @*=expand("%:p:h")<CR>
" Variants of the above if it's necessary to obtain the paths converted to
" alternate OS.  This can be useful eg. when on windows and needing to
" interact with unix based tools etc.
if has('win32') || has('win64')
  " Convert back slashes to forward slashes on Windows.
  nmap <Leader>afc :let @*=substitute(expand("%"), "\\", "/", "g")<CR>
  nmap <Leader>AFC :let @*=substitute(expand("%:p"), "\\", "/", "g")<CR>
  nmap <Leader>apc :let @*=substitute(expand("%:h"), "\\", "/", "g")<CR>
  nmap <Leader>APC :let @*=substitute(expand("%:p:h"), "\\", "/", "g")<CR>
else
  " Convert forward slashes to back slashes on linux.
  nmap <Leader>afc :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap <Leader>AFC :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
  nmap <Leader>apc :let @*=substitute(expand("%:h"), "/", "\\", "g")<CR>
  nmap <Leader>APC :let @*=substitute(expand("%:p:h"), "/", "\\", "g")<CR>
endif

" Make a shortcut to remove "^M" characters from a buffer.
nnoremap <Leader>am :execute "%s/\r//g"<CR>
nnoremap <Leader>AM :execute "%s/\r/\r/g"<CR>


" Setup the 'boxes' tool to support comment etc. using unimpaired style.
autocmd BufEnter * nmap [ac !!boxes -d boxquote<CR>
autocmd BufEnter * vmap [ac !boxes -d boxquote<CR>
autocmd BufEnter * nmap ]ac !!boxes -d boxquote -r<CR>
autocmd BufEnter * vmap ]ac !boxes -d  boxquote -r<CR>

autocmd BufEnter *.[chly],*.[pc]c nmap [ac !!boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap [ac !boxes -d c-cmt<CR>
autocmd BufEnter *.[chly],*.[pc]c nmap ]ac !!boxes -d c-cmt -r<CR>
autocmd BufEnter *.[chly],*.[pc]c vmap ]ac !boxes -d c-cmt -r<CR>

autocmd BufEnter *.C,*.cpp,*.cs,*.java nmap [ac !!boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.cs,*.java vmap [ac !boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.cs,*.java nmap ]ac !!boxes -d java-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.cs,*.java vmap ]ac !boxes -d java-cmt -r<CR>

autocmd BufEnter *.C,*.cpp,*.cs,*.java nmap [ac !!boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.cs,*.java vmap [ac !boxes -d java-cmt<CR>
autocmd BufEnter *.C,*.cpp,*.cs,*.java nmap ]ac !!boxes -d java-cmt -r<CR>
autocmd BufEnter *.C,*.cpp,*.cs,*.java vmap ]ac !boxes -d java-cmt -r<CR>

autocmd BufEnter .vimrc*,.exrc nmap [ac !!boxes -d vim-cmt<CR>
autocmd BufEnter .vimrc*,.exrc vmap [ac !boxes -d vim-cmt<CR>
autocmd BufEnter .vimrc*,.exrc nmap ]ac !!boxes -d vim-cmt -r<CR>
autocmd BufEnter .vimrc*,.exrc vmap ]ac !boxes -d vim-cmt -r<CR>

" Setup a shortcut to toggle spelling on & off
imap <Leader>as <C-o>:setlocal spell! spelllang=en_gb<CR>
nmap <Leader>as :setlocal spell! spelllang=en_gb<CR>

" Support xaml file editing.
au BufNewFile,BufRead *.xaml setf xml

" Use easier help navigation
:au filetype help :nnoremap <buffer> <CR> <c-]>
:au filetype help :nnoremap <buffer> - <c-T>
:au filetype help :nnoremap <buffer> <DEL> <c-T>
:au filetype help :nnoremap <buffer> <BS> <c-T>
:au filetype help :nnoremap <buffer> o /'\l\{2,\}'<CR>
:au filetype help :nnoremap <buffer> O ?'\l\{2,\}'<CR>
:au filetype help :nnoremap <buffer> s /<Bar>\zs\k*\ze<Bar><CR>
:au filetype help :nnoremap <buffer> S ?<Bar>\zs\k*\ze<Bar><CR>

" Allow the cursor to move beyond the end of a line, which is useful when
" creating tables.
set virtualedit=all

" }}}

" FixTerminal Function {{{

" Create a function to setup the current terminal session as preferred so
" that it can readily be called upon to correct any anomolies.
" Also, invoke it now as part of the vimrc.
" Note: Useful commands to understand the terminal
"       :colourscheme <TAB>
"       :echo g:colors_name
"       :set background?
"       :echo $TERM
"       :set term?
function! FixTerminal()
    if has("gui_running")
        if has("gui_gnome")
            set term=gnome-256color
            set guifont=Monospace\ Bold\ 8
        endif

        if has("gui_mac") || has("gui_macvim")
            set guifont=Menlo:h12
        endif

        if has("gui_win32") || has("gui_win32s")
            set guifont=Consolas:h8
            set enc=utf-8
        endif

        set t_Co=256
        set guitablabel=%M%t
        set background=dark
        colorscheme xterm16
    else
        " dont load csapprox if there is no gui support - silences an annoying warning
        let g:CSApprox_loaded = 1

        if $TERM == 'xterm'
            set term=xterm-256color
        elseif $TERM == 'xtermc'
            set term=xtermc
        elseif $TERM == 'screen'
            set term=screen-256color
        elseif $TERM == 'screen-256color'
            set term=screen-256color
        elseif $TERM == 'cygwin'
            " Neither custom colorschemes work well in cygwin
            " (aka. git for windows)
            set term=win32
            set background=dark
            colorscheme default
        endif
    endif
    set number
    set mouse=a
endfunction
call FixTerminal()

" }}}

" FixWhitespace Function {{{

" 38. Help eliminate untidy whitespace
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction
" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" trailing = 1 (trailing whitespace is removed), 0 (leave it alone).
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols, trailing)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  if a:trailing == 1
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call histdel('search', -1)
  endif
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>,0)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>,0)
command! -nargs=? -range=% FixWhitespace call IndentConvert(<line1>,<line2>,&et,<q-args>,1)

 " }}}

" 39. Open Listed Files Function {{{
" Facilitates command line searching, collect a list of files in vim, then
" open them all.
command! -range=% OpenListedFiles <line1>,<line2>call OpenListedFiles()

function! OpenListedFiles() range
    let FileList = getline(a:firstline, a:lastline)
    for filename in FileList
        if filereadable(filename)
            exe 'tabedit' filename
        endif
    endfor
endfunction

" }}}
