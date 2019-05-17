" Variant of xterm16 color scheme file
"
" Sets colors for a 16 color terminal. Can be used with 8 color terminals
" provided VIM is configured to set the bold attribute for higher colors.
" Defines GUI colors to be identical to the terminal colors

" Setup ----------------------------------------------------{{{
set bg=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = 'xterm16_af'

"}}}
" The Colors -----------------------------------------------{{{
" Define reusable colours.
let s:afnone = 'NONE'
let s:afblack= { "gui": "#000000", "cterm": "16" }
let s:afwhite= { "gui": "#FFFFFF", "cterm": "white" }
let s:afdarkgrey = { "gui" : "#808080", "cterm": "darkgrey" }
let s:afgrey = { "gui" : "#C0C0C0", "cterm": "grey" }
let s:afdarkred = { "gui" : "#CD0000", "cterm": "darkred" }
let s:afred = { "gui" : "#FF0000", "cterm": "red" }
let s:afdarkgreen = { "gui" : "#00CD00", "cterm": "darkgreen" }
let s:afgreen = { "gui" : "#00FF00", "cterm": "green" }
let s:afdarkyellow = { "gui" : "#CDCD00", "cterm": "darkyellow" }
let s:afyellow = { "gui" : "#FFFF00", "cterm": "yellow" }
let s:afdarkblue = { "gui" : "#0000FF", "cterm": "darkblue" }
let s:afblue = { "gui" : "#0080FF", "cterm": "blue" }
let s:afdarkcyan = { "gui" : "#00CDCD", "cterm": "darkcyan" }
let s:afcyan = { "gui" : "#00FFFF", "cterm": "cyan" }
let s:afdarkmagenta = { "gui" : "#CD00CD", "cterm": "darkmagenta" }
let s:afmagenta = { "gui" : "#FF00FF", "cterm": "magenta" }

" Define GUI colors to be exactly the same as xterm colors. To change any
" paticular color, set the variable "g:colorname" to be that color (before you
" load this color scheme.)

let s:none		= 'NONE'
let s:black		= exists("g:black") ? g:black :		    '#000000'
let s:darkred		= exists("g:darkred") ? g:darkred :	    '#CD0000'
let s:darkgreen		= exists("g:darkgreen") ? g:darkgreen :	    '#00CD00'
let s:darkyellow	= exists("g:darkyellow") ? g:darkyellow :   '#CDCD00'
let s:darkblue		= exists("g:darkblue") ? g:darkblue : 	    '#0000FF'
let s:darkmagenta	= exists("g:darkmagenta") ? g:darkmagenta : '#CD00CD'
let s:darkcyan		= exists("g:darkcyan") ? g:darkcyan :	    '#00CDCD'
let s:grey		= exists("g:grey") ? g:grey :		    '#C0C0C0'
let s:darkgrey		= exists("g:darkgrey") ? g:darkgrey :	    '#808080'
let s:red		= exists("g:red") ? g:red :		    '#FF0000'
let s:green		= exists("g:green") ? g:green :		    '#00FF00'
let s:yellow		= exists("g:yellow") ? g:yellow :	    '#FFFF00'
let s:blue		= exists("g:blue") ? g:blue :		    '#0080FF'
let s:magenta		= exists("g:magenta") ? g:magenta :	    '#FF00FF'
let s:cyan		= exists("g:cyan") ? g:cyan :		    '#00FFFF'
let s:white		= exists("g:white") ? g:white :		    '#FFFFFF'

"}}}
" Utilility Function ---------------------------------------{{{
function! s:h(group, style)
execute "highlight" a:group
\ "guifg=" (has_key(a:style, "fg") ? a:style.fg.gui : "NONE")
\ "guibg=" (has_key(a:style, "bg") ? a:style.bg.gui : "NONE")
\ "guisp=" (has_key(a:style, "sp") ? a:style.sp.gui : "NONE")
\ "gui=" (has_key(a:style, "gui") ? a:style.gui : "NONE")
\ "ctermfg=" (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
\ "ctermbg=" (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
\ "cterm=" (has_key(a:style, "cterm") ? a:style.cterm : "NONE")
endfunction

"}}}
" Highlights - UI ------------------------------------------{{{
" Set cterm colors. Some are set here even though they are equal to their
" default settings because the GUI settings need to be modified

call s:h("Normal", { "cterm": "none", "fg": s:afgrey, "bg": s:afblack })
call s:h("cursor", { "cterm": "none", "fg": s:afblack, "bg": s:afgreen })
call s:h("foldcolumn", { "cterm": "none", "fg": s:afdarkgrey, "bg": s:afblack })
call s:h("folded", { "cterm": "none", "fg": s:afdarkgrey, "bg": s:afblack })
call s:h("incsearch", { "cterm": "none", "fg": s:afgrey, "bg": s:afdarkblue })
call s:h("moremsg", { "gui": "bold", "cterm": "bold", "fg": s:afgreen})
call s:h("nontext", { "cterm": "none", "fg": s:afblue})
call s:h("search", { "cterm": "none", "fg": s:afdarkblue, "bg": s:afdarkcyan })
call s:h("specialkey", { "cterm": "none", "fg": s:afblue})
call s:h("statusline", { "cterm": "none", "fg": s:afwhite, "bg": s:afblack })
call s:h("statuslinec", { "cterm": "reverse"})
call s:h("title", { "cterm": "none", "fg": s:afmagenta })
call s:h("visual", { "cterm": "none", "bg": s:afdarkblue })
call s:h("visualnos", { "cterm": "none", "bg": s:afdarkgrey })
call s:h("warningmsg", { "gui": "bold", "cterm": "bold", "fg": s:afdarkred })
call s:h("vertsplit", { "cterm": "none", "fg": s:afwhite, "bg": s:afblack })
call s:h("linenr", { "cterm": "none", "fg": s:afdarkgrey })
call s:h("TabLine", { "cterm": "none", "fg": s:afwhite, "bg": s:afdarkgrey })
call s:h("TabLineSel", { "cterm": "none", "fg": s:afwhite, "bg": s:afblack })
call s:h("TabLineFill", { "cterm": "none", "fg": s:afwhite, "bg": s:afblack })
call s:h("PMenu", { "cterm": "none", "fg": s:afwhite, "bg": s:afblue })
call s:h("PMenuSBar", { "cterm": "none", "fg": s:afwhite, "bg": s:afgrey })
call s:h("PMenuThumb", { "cterm": "none", "fg": s:afwhite, "bg": s:afgrey })
call s:h("PMenuSel", { "cterm": "none", "fg": s:afwhite, "bg": s:afgrey })
call s:h("SignColumn", { "cterm": "none", "fg": s:afwhite, "bg": s:afblack })

"}}}
" Highlights - Diff ----------------------------------------{{{
call s:h("DiffAdd", { "cterm": "none", "fg": s:afgreen, "bg": s:afblack})
call s:h("DiffDelete", { "cterm": "none", "fg": s:afred, "bg": s:afblack} )
call s:h("DiffChange", { "cterm": "none", "fg": s:afyellow, "bg": s:afblack} )
call s:h("DiffText", { "cterm": "none", "fg": s:afblack, "bg": s:afyellow} )
-call s:h("diffadded", { "cterm": "none", "fg": s:afdarkgreen })
-call s:h("diffchanged", { "cterm": "none", "fg": s:afdarkyellow })
-call s:h("diffremoved", { "cterm": "none", "fg": s:afdarkred })
-call s:h("difffile", { "cterm": "none", "fg": s:afdarkcyan })
-call s:h("diffline", { "cterm": "none", "fg": s:afdarkcyan })

"}}}
" Highlights - Syntax -------------------------------------{{{
call s:h("todo", { "cterm": "none", "fg": s:afblack, "bg": s:afyellow })
call s:h("error", { "cterm": "none", "fg": s:afwhite, "bg": s:afred})
call s:h("comment", { "cterm": "none", "fg": s:afdarkgrey})
call s:h("constant", { "cterm": "none", "fg": s:afyellow})
call s:h("identifier", { "cterm": "none", "fg": s:afwhite})
call s:h("ignore", { "cterm": "none", "fg": s:afdarkgrey})
call s:h("preproc", { "cterm": "none", "fg": s:afdarkcyan})
call s:h("special", { "cterm": "none", "fg": s:afdarkgreen})
call s:h("statement", { "cterm": "none", "fg": s:afdarkcyan})
call s:h("type", { "cterm": "none", "fg": s:afdarkgreen })
call s:h("underlined", { "cterm": "none", "fg": s:afdarkmagenta })

"}}}
" Highlights - HTML ----------------------------------------{{{
" Html groups use cterm attributes (which SUCK), so we change them here. The
" GUI attributes are OK, and are unchanged. If you do not want your precious
" html groups touched, set the variable "xterm16_NoHtmlColors" in your .vimrc
"
" If html colors don't work correctly, set the variable "html_no_rendering"
if !exists("g:xterm16_NoHtmlColors")
    call s:h("htmlBold", { "gui": "bold", "cterm": "none", "fg": s:afwhite })
    call s:h("htmlItalic", { "gui": "italic", "cterm": "none", "fg": s:afyellow })
    call s:h("htmlUnderline", { "gui": "underline", "cterm": "none", "fg": s:afmagenta })
    call s:h("htmlBoldItalic", { "gui": "bold,italic", "cterm": "bold", "fg": s:afwhite })
    call s:h("htmlBoldUnderline", { "gui": "bold,underline", "cterm": "bold", "fg": s:afwhite })
    call s:h("htmlUnderlineItalic", { "gui": "italic,underline", "cterm": "bold", "fg": s:afwhite })
    call s:h("htmlBoldUnderlineItalic", { "gui": "bold,italic,underline", "cterm": "bold", "fg": s:afwhite })
    call s:h("htmlLink", { "cterm": "none", "fg": s:afdarkcyan})
endif

"}}}

" vim: fdm=marker
