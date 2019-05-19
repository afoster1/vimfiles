" vim:fdm=marker

" General vim configuration {{{

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
