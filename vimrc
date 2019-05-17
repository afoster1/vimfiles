" vim:fdm=marker

" Initialisation {{{
set nocompatible " Don't insist on compatibility with vi.
" }}}

" Helper Functions {{{
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists("*mkdir")
      call mkdir(a:dir,'p')
    else
      echo "Please create directory: " . a:dir
    endif
  endif
endfunction

function! TabLeft()
    let tab_number = tabpagenr()
    if tab_number == 1
        execute "tabm" tabpagenr('$')
    else
        execute "tabm" tab_number - 2
    endif
endfunction

function! TabRight()
    let tab_number = tabpagenr()
    let last_tab_number = tabpagenr('$')
    if tab_number == last_tab_number
        execute "tabm" 0
    else
        execute "tabm" tab_number + 1
    endif
endfunction
" }}}

" Bootstrap Plugin Manager (vim-plug) {{{
" See "junegunn/vim-plug"
if has('win32') || has('win64')
  let plug_vim_home=expand('$HOME/vimfiles/pvbundle')
  let plug_vim_dir=expand('$HOME/vimfiles/autoload')
else
  let plug_vim_home=expand('~/.vim/pvbundle')
  let plug_vim_dir=expand('~/.vim/autoload')
endif
let plug_vim_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
let plug_vim_file=expand(plug_vim_dir.'/plug.vim')
if empty(glob(plug_vim_file))
  call EnsureDirExists(plug_vim_dir)
  " Windows: Get "curl" via msys2 or get "wget" via gnuwin32
  if (executable("curl"))
    silent exec "!curl -sfLo " . plug_vim_file . " --create-dirs " . plug_vim_url
  endif
  if (executable("wget") && empty(glob(plug_vim_file)))
    silent exec "!wget --no-check-certificate -nc -q " . plug_vim_url . " -P " . plug_vim_dir
  endif
  if !empty(glob(plug_vim_file))
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif
" }}}

" Load Plugins {{{
if !empty(glob(plug_vim_file))
  call plug#begin(plug_vim_home)
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-fugitive'
  call plug#end()
endif
" }}}

" Keyboard Mappings {{{
" g
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>
" t
nmap <Leader>t :tabnew<CR>
nmap <Leader>h :tabprevious<CR>
nmap <Leader>l :tabnext<CR>
nmap <Leader>j :execute TabLeft()<CR>
nmap <Leader>k :execute TabRight()<CR>
" }}}
