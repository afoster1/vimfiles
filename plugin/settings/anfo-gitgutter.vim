" vim:fdm=marker

" gitgutter plugin integration {{{

let g:gitgutter_enabled = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '#'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = g:gitgutter_sign_modified

highlight link GitGutterAdd DiffAdd
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChange DiffChange
highlight link GitGutterChangeDelete DiffChange


" }}}
