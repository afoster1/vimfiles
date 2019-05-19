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

" Ensure the fill characters used for window separators are not invisible...
" this shouldn't be so by default, but can't be relied upon.
set fillchars=stl:=,stlnc:-,vert:\|,fold:-,diff:-

" Setup the tab bar as preferred.
set showtabline=1
" Rename tabs to show tab# and # of viewports
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let s .= '%#TabLineFill#' " Start off with empty Highlighting

        for i in range(tabpagenr('$')) " Process each tab that exists
            let curtabnr = tabpagenr()
            let tabnr = i+1 " range() is zero based.
            let winnr = tabpagewinnr(tabnr) " gets the current window of the current tab.
            let nrwins = tabpagewinnr(tabnr, '$') " gets the number of windows in the current tab.
            let buflist = tabpagebuflist(tabnr) " gets a list of buffers associated with the windows in the current tab.
            let bufnr = buflist[winnr - 1] " current buffer number
            let bufname = bufname(bufnr) " gets the name of the current buffer in the current window of the current tab
            let buftype = getbufvar(bufnr, 'buftype') " Establish the type of buffer.

            let s .= '%' . tabnr  . 'T' " Start a tab
            let s .= (tabnr==curtabnr ? '%#TabLineSel#' : '%#TabLine#') " Set the correct highlight
            let s .= bufnr " Add the buffer number
            if nrwins > 1 " Add the current window number.
                let s .= '+'
            end

            let tabname = bufname " Work out an appropriate tab name.
            if buftype == 'nofile'
                if tabname +~ '\/.'
                    let tabname = substitute(tabname, '.*\/\ze.', '', '')
                endif
            else
                let tabname = fnamemodify(tabname, ':p:t')
            endif
            if tabname == ''
                let tabname = '[None]'
            endif
            let s .= ' '
            let s .= tabname

            let bufmodified = getbufvar(bufnr, "&mod") " has the buffer been changed?
            if bufmodified
                let s .= '+'
            endif

            let s .= '%#TabLineFill#' " Include a gap between the tabs
            let s .= ' '
        endfor

        let s .= '%=' " seperate left-aligned from right-aligned
        let s .= '%#TabLine#' " set highlight for the 'X' below
        let s .= '%999XX' " places an 'X' at the far-right
        return s
    endfunction
    set tabline=%!MyTabLine()
endif

" Make it possible to toggle the state of cursor line & column
" highlighting. (aka. cross-hair cursor locator).
let g:crosshairState = 0
function! s:toggleCrosshair()
    if g:crosshairState == 0
        let g:crosshairState=1
        set cursorline
        set cursorcolumn
    elseif g:crosshairState == 1
        let g:crosshairState=2
        set cursorline
        set nocursorcolumn
    elseif g:crosshairState == 2
        let g:crosshairState=3
        set nocursorline
        set cursorcolumn
    elseif g:crosshairState == 3
        let g:crosshairState=0
        set nocursorline
        set nocursorcolumn
    endif
endfunction
function! s:resetCrosshair()
    let g:crosshairState=0
    set nocursorline
    set nocursorcolumn
endfunction
:nnoremap <Leader>x :call <SID>toggleCrosshair()<CR>
:nnoremap <Leader>X :call <SID>resetCrosshair()<CR>

" }}}
