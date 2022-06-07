" vim:fdm=marker

" 'junegunn/fzf.vim' plugin integration {{{

" Use a command prefix, to find them easily.
let g:fzf_command_prefix = 'Fzf'

" Preferred git commit formatting.
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" How to generate tags file.
let g:fzf_tags_command = 'ctags -R'

" Preview window, hidden by default, ctrl-q to toggle visibility
let g:fzf_preview_window = ['right:40%:hidden', 'ctrl-q']

" Remove the status line from fzf window
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" Operates in a new tab, full screen.
let g:fzf_layout = { 'window': '-tabnew' }

" Find filenames keyboard shortcut, simulates ctrlp plugin
nnoremap <C-p> :FzfFiles<Cr>

" Using "silversearcher" search filenames and content.
nnoremap <C-g> :FzfAg<Cr>

" Find open buffers
nnoremap <silent><leader>b :FzfBuffers<CR>

" Find everywhere (in loaded buffers)
nnoremap <silent><leader>e :FzfLines<CR>

" Find here (in current buffer)
nnoremap <silent><leader>f :FzfBLines<CR>

" Find git commits
nnoremap <silent><leader>c :FzfCommits<CR>

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" }}}
