" Vim color file  
" Maintainer:   Andrew Foster <afoster1@gmail.com>  
" Last Change:  2012 Apr 16  
"
" NOTE: To see the affects of colourscheme changes use :so $VIMRUNTIME/syntax/hitest.vim
  
" This color scheme uses a white background and attempts to stay as close as  
" possible to Visual Studio's defaults.  
" Note: Every attempt has been made to ensure this theme also works in a standard terminal.  
  
" First remove all existing highlighting.  
set background=light  
hi clear  
if exists("syntax_on")  
  syntax reset  
endif  
  
let colors_name = "vssim"  
  
hi Normal ctermfg=Black ctermbg=White guifg=Black guibg=White  
  
" Groups used in the 'highlight' and 'guicursor' options default value.  
hi ErrorMsg term=standout ctermbg=DarkRed ctermfg=White guibg=Red guifg=White  
hi IncSearch term=reverse cterm=reverse gui=reverse  
hi ModeMsg term=bold cterm=bold gui=bold  
hi StatusLine term=reverse,bold ctermfg=DarkBlue cterm=reverse,bold gui=reverse,bold guifg=DarkBlue
hi StatusLineNC term=reverse cterm=reverse gui=reverse  
hi VertSplit term=none cterm=none ctermfg=DarkBlue ctermbg=White gui=none guifg=DarkBlue guibg=White
hi Visual term=reverse ctermbg=grey guibg=grey80  
hi VisualNOS term=underline,bold cterm=underline,bold gui=underline,bold  
hi Cursor guibg=Green guifg=NONE  
hi lCursor guibg=Cyan guifg=NONE  
hi Directory term=bold ctermfg=DarkBlue guifg=Blue  
hi LineNr term=underline ctermfg=DarkCyan guifg=DarkCyan  
hi MoreMsg term=bold ctermfg=DarkGreen gui=bold guifg=SeaGreen  
hi NonText term=bold ctermfg=Blue gui=bold guifg=Blue guibg=grey80  
hi Question term=standout ctermfg=DarkGreen gui=bold guifg=SeaGreen  
hi Search term=reverse ctermbg=Yellow ctermfg=NONE guibg=Yellow guifg=NONE  
hi SpecialKey term=bold ctermfg=DarkBlue guifg=Blue  
hi Title term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta  
hi WarningMsg term=standout ctermfg=DarkRed guifg=Red  
hi WildMenu term=standout ctermbg=Yellow ctermfg=Black guibg=Yellow guifg=Black  
hi Folded term=standout ctermbg=White ctermfg=DarkBlue guibg=White guifg=DarkBlue  
hi FoldColumn term=standout ctermbg=White ctermfg=DarkBlue guibg=White guifg=DarkBlue  
hi DiffAdd term=bold ctermfg=Green ctermbg=White guifg=Green guibg=White
hi DiffDelete term=bold ctermfg=Red ctermbg=White guifg=Red guibg=White
hi DiffChange term=bold ctermfg=Cyan ctermbg=White guifg=Cyan guibg=White
hi DiffText term=bold ctermfg=Black ctermbg=Cyan guifg=Black guibg=Cyan
hi DiffAdded term=bold ctermfg=Green ctermbg=White guifg=Green guibg=White
hi DiffChanged term=bold ctermfg=Green ctermbg=White guifg=Green guibg=White
hi DiffRemoved term=bold ctermfg=Red ctermbg=White guifg=Red guibg=White
hi DiffFile term=bold ctermfg=DarkCyan ctermbg=White guifg=DarkCyan guibg=White
hi DiffLine term=bold ctermfg=DarkCyan ctermbg=White guifg=DarkCyan guibg=White
hi CursorLine term=underline cterm=underline guibg=grey80  
hi CursorColumn term=reverse ctermbg=grey guibg=grey80  
hi SignColumn term=reverse ctermbg=White guibg=White  

" Colors for syntax highlighting  
hi Comment term=bold ctermfg=DarkGreen guifg=DarkGreen  
hi Constant term=underline ctermfg=DarkRed guifg=DarkRed  
hi Special term=bold ctermfg=DarkRed guifg=DarkRed  
hi Identifier term=underline ctermfg=Blue guifg=Blue  
hi Statement term=bold ctermfg=Blue gui=bold guifg=Blue  
hi PreProc term=underline ctermfg=Blue guifg=Blue  
hi Type term=underline ctermfg=Blue gui=bold guifg=Blue  
hi Ignore cterm=bold ctermfg=LightGrey guifg=LightGrey  
hi Error term=reverse cterm=bold ctermfg=White ctermbg=Red gui=bold guifg=White guibg=Red  
hi Todo term=standout ctermfg=Blue ctermbg=Yellow guifg=Blue guibg=Yellow  
  
" vim: sw=2  
