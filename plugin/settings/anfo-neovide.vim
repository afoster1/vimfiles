if exists("g:neovide")
    " Enable the cursor effects
    let g:neovide_cursor_vfx_mode = "pixiedust"
    " Make the window corners square.
    let g:neovide_corner_preference = "do_not_round"

    " Get paste working in the command line
    set clipboard+=unnamedplus
    cnoremap <C-v> <C-r>+
    cnoremap <S-Insert> <C-r>+
endif
