" vim:fdm=marker

" 'unite' plugin integration {{{

function! SetUniteSourceMaxCandidates(sources)
    let curline = getline('.')
    call inputsave()
    let max_candidates = input('Max candidates: ')
    call inputrestore()
    call unite#custom#source(a:sources, 'max_candidates', max_candidates)
    let g:unite_source_grep_max_candidates = max_candidates
endfunction

call unite#custom#source('grep', 'max_candidates', 200)
call unite#custom#source('line', 'max_candidates', 200)
call unite#custom#source('file', 'max_candidates', 200)
if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''

  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']
elseif executable('ack')
  let g:unite_source_rec_async_command = ['ack', '-f', '--nofilter', '']
endif
if has('win32') || has('win64')
    let g:unite_source_file_async_command = 'dir'
else
    let g:unite_source_file_async_command = 'ls -a'
endif
noremap <leader>/l :Unite -direction=dynamicbottom -multi-line -buffer-name=lines -create -auto-highlight -no-quit -start-insert line -auto-highlight<CR>
noremap <leader>/lc :call SetUniteSourceMaxCandidates('line')<CR>
noremap <leader>/f :Unite -direction=dynamicbottom -multi-line -buffer-name=files -no-quit -start-insert file file_rec/async<CR>
noremap <leader>/fc :call SetUniteSourceMaxCandidates('file')<CR>
noremap <leader>/F :Unite -direction=dynamicbottom -multi-line -buffer-name=files -no-quit -start-insert file_mru file file_rec/async<CR>
noremap <leader>, :Unite -direction=dynamicbottom -multi-line -buffer-name=files -start-insert file_mru file file_rec/async<CR>
noremap <leader>/b :Unite -direction=dynamicbottom -multi-line -buffer-name=bookmarks -no-quit -start-insert vim_bookmarks<CR>
noremap <leader>/B :Unite -direction=dynamicbottom -multi-line -buffer-name=buffers -start-insert -quick-match buffer<CR>
noremap <leader>; :Unite -direction=dynamicbottom -multi-line -buffer-name=buffers -start-insert buffer<CR>
noremap <leader>/c :Unite -direction=dynamicbottom -multi-line -buffer-name=colours -start-insert colorscheme<CR>
noremap <leader>/g :Unite -direction=dynamicbottom -multi-line -buffer-name=grep -create -auto-highlight -no-quit -start-insert grep:.<CR>
noremap <leader>/gb :Unite -direction=dynamicbottom -multi-line -buffer-name=grep -create -auto-highlight -no-quit -start-insert grep:$buffers<CR>
noremap <leader>/gc :call SetUniteSourceMaxCandidates('grep')<CR>
let g:unite_source_history_yank_enable = 1
noremap <leader>/y :Unite -direction=dynamicbottom -multi-line -buffer-name=history -start-insert history/yank<CR>
noremap <leader>/t :Unite -direction=dynamicbottom -multi-line -buffer-name=tags -create -auto-highlight -no-quit -start-insert tag<CR>
noremap <leader>/o :Unite -direction=dynamicbottom -multi-line -buffer-name=outline -create -auto-highlight -no-quit -start-insert outline<CR>
noremap <leader>/h :Unite -direction=dynamicbottom -multi-line -buffer-name=help -start-insert help<CR>
noremap <leader>/m :Unite -direction=dynamicbottom -multi-line -buffer-name=man -start-insert manpage<CR>
noremap <leader>/q :Unite -direction=dynamicbottom -multi-line -buffer-name=quickfix -create -auto-highlight -no-quit -start-insert qf<CR>
noremap <leader>/Q :Unite -direction=dynamicbottom -multi-line -buffer-name=location -create -auto-highlight -no-quit -start-insert locationlist<CR>
noremap <leader>/p :Unite -direction=dynamicbottom -multi-line -buffer-name=processes -start-insert process<CR>

" }}}

