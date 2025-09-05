" vim:fdm=marker

" thematic plugin integration {{{

" Set preferred font size
let s:default_font_size = 11
let g:font_size = s:default_font_size

" Set default theme name
let s:default_theme_name = 'light'

" keymaps to control the font size
nnoremap <S-F2> :call SetThemeFontSize(g:font_size - 1)<CR>
nnoremap <F2> :call SetThemeFontSize(g:font_size + 1)<CR>

" 'unimpaired' style key to switch the lights on/off.
nnoremap [al :call SetThemeName('light')<CR>
nnoremap ]al :call SetThemeName('dark')<CR>
nnoremap {AL :call SetThemeName('altlight')<CR>
nnoremap }AL :call SetThemeName('altdark')<CR>

" Load/Reload Thematic's theme definitions
function! s:loadThemes()
    let g:thematic#defaults =
        \ {
        \   'typeface': 'Cascadia Code',
        \   'font-size': g:font_size,
        \   'airline-theme': 'solarized',
        \ }

    let g:thematic#themes = {
        \ 'altlight'  :
        \   {
        \       'colorscheme': 'materialbox',
        \       'background': 'light'
        \   },
        \ 'altdark'  :
        \   {
        \       'colorscheme': 'materialbox',
        \       'background': 'dark'
        \   },
        \ 'dark'  :
        \   {
        \       'colorscheme': 'solarized8',
        \       'background': 'dark'
        \   },
        \ 'light'  :
        \   {
        \       'colorscheme': 'solarized8',
        \       'background': 'light'
        \   }
        \ }
endfunction

" Load and set a theme
function! s:setTheme(theme_name)
    call s:loadThemes()
    execute 'Thematic' a:theme_name
endfunction

" Function to re-load themes as the font size changes
function! SetThemeFontSize(font_size)
    if !empty(g:thematic#theme_name)
        if a:font_size >= 0
            if a:font_size <= 99
                let g:font_size = a:font_size
            endif
        endif

        call s:setTheme(g:thematic#theme_name)
    endif
endfunction

" Function to set the theme name and refresh
function! SetThemeName(theme_name)
    let l:theme_name = a:theme_name
    if empty(l:theme_name)
        let l:theme_name = s:default_theme_name
    endif
    call s:setTheme(l:theme_name)
endfunction

" }}}
