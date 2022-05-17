" vim:fdm=marker

" thematic plugin integration {{{

let g:window_width = 1
let g:window_height = 1
let g:font_size = 1
let g:is_light = 0
let g:window_width_saved = g:window_width
let g:window_height_saved = g:window_height
function! ToggleMaximiseTheme()
    if g:window_height == 3 && g:window_width == 3
        " Restore
        let g:window_width = g:window_width_saved
        let g:window_height = g:window_height_saved
    else
        " Maximise
        let g:window_width_saved = g:window_width
        let g:window_height_saved = g:window_height
        let g:window_width = 3
        let g:window_height = 3
    endif

    call SetTheme()
endfunction
function! SetTheme()
    if g:is_light == 1
        let l:theme_name='light'
    else
        let l:theme_name='dark'
    endif

    if has("gui_running")
        let l:theme_name.='_'
        if g:window_height <= 0
            let g:window_height = 0
            let l:theme_name.='s'
        elseif g:window_height == 1
            let l:theme_name.='m'
        elseif g:window_height == 2
            let l:theme_name.='l'
        else
            let g:window_height = 3
            let l:theme_name.='x'
        endif
        if g:window_width <= 0
            let g:window_width = 0
            let l:theme_name.='s'
        elseif g:window_width == 1
            let l:theme_name.='m'
        elseif g:window_width == 2
            let l:theme_name.='l'
        else
            let g:window_width = 3
            let l:theme_name.='x'
        endif
        if g:font_size <= 0
            let g:font_size = 0
            let l:theme_name.='s'
        elseif g:font_size == 1
            let l:theme_name.='m'
        else
            let g:font_size = 2
            let l:theme_name.='l'
        endif
    endif

    if has("gui_running")
        let l:theme_name.='_gui'
    else
        let l:theme_name.='_term'
    endif

    echo l:theme_name
    execute 'Thematic' l:theme_name
endfunction

let g:font_l = 10
let g:font_m = 8
let g:font_s = 6

let g:colorscheme_name_dark = 'solarized'
let g:colorscheme_airline_name_dark = 'solarized'
let g:colorscheme_name_light = 'solarized'
let g:colorscheme_airline_name_light = 'solarized'

let g:window_columns_x = 999
let g:window_columns_l = 220
let g:window_columns_m = 120
let g:window_columns_s = 80
" The number of rows depends on the font.  These variables indicate the font
" via the name as in  _[font]_[height]
let g:window_rows_l_x = 999
let g:window_rows_l_l = 66
let g:window_rows_l_m = 48
let g:window_rows_l_s = 30
let g:window_rows_m_x = 999
let g:window_rows_m_l = 80
let g:window_rows_m_m = 60
let g:window_rows_m_s = 40
let g:window_rows_s_x = 999
let g:window_rows_s_l = 110
let g:window_rows_s_m = 81
let g:window_rows_s_s = 52
let g:thematic#defaults = {
\   'typeface': 'Source Code Pro',
\   'font-size': g:font_m,
\   'colorscheme': 'xterm16_af',
\   'background': 'dark',
\   'airline-theme': 'dark',
\   'linespace': 0,
\   'lines': 60,
\ }

" Interpret as [light|dark]_[height}[width][font]_gui
let g:thematic#themes = {
\ 'dark_term'  : { 'colorscheme': 'xterm16_af', 'airline-theme': 'dark', 'background': 'dark', 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_m, },
\ 'light_term'  : { 'colorscheme': 'xterm16_af', 'airline-theme': 'dark', 'background': 'dark', 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_m, },
\ 
\ 'dark_xxl_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_x, 'lines': g:window_rows_l_x, },
\ 'dark_xxm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_x, 'lines': g:window_rows_m_x, },
\ 'dark_xxs_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_x, 'lines': g:window_rows_s_x, },
\ 'dark_xll_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_l, 'lines': g:window_rows_l_x, },
\ 'dark_xlm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_l, 'lines': g:window_rows_m_x, },
\ 'dark_xls_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_l, 'lines': g:window_rows_s_x, },
\ 'dark_xml_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_m, 'lines': g:window_rows_l_x, },
\ 'dark_xmm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_x, },
\ 'dark_xms_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_m, 'lines': g:window_rows_s_x, },
\ 'dark_xsl_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_s, 'lines': g:window_rows_l_x, },
\ 'dark_xsm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_s, 'lines': g:window_rows_m_x, },
\ 'dark_xss_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_s, 'lines': g:window_rows_s_x, },
\
\ 'dark_lxl_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_x, 'lines': g:window_rows_l_l, },
\ 'dark_lxm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_x, 'lines': g:window_rows_m_l, },
\ 'dark_lxs_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_x, 'lines': g:window_rows_s_l, },
\ 'dark_lll_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_l, 'lines': g:window_rows_l_l, },
\ 'dark_llm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_l, 'lines': g:window_rows_m_l, },
\ 'dark_lls_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_l, 'lines': g:window_rows_s_l, },
\ 'dark_lml_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_m, 'lines': g:window_rows_l_l, },
\ 'dark_lmm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_l, },
\ 'dark_lms_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_m, 'lines': g:window_rows_s_l, },
\ 'dark_lsl_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_s, 'lines': g:window_rows_l_l, },
\ 'dark_lsm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_s, 'lines': g:window_rows_m_l, },
\ 'dark_lss_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_s, 'lines': g:window_rows_s_l, },
\
\ 'dark_mxl_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_x, 'lines': g:window_rows_l_m, },
\ 'dark_mxm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_x, 'lines': g:window_rows_m_m, },
\ 'dark_mxs_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_x, 'lines': g:window_rows_s_m, },
\ 'dark_mll_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_l, 'lines': g:window_rows_l_m, },
\ 'dark_mlm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_l, 'lines': g:window_rows_m_m, },
\ 'dark_mls_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_l, 'lines': g:window_rows_s_m, },
\ 'dark_mml_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_m, 'lines': g:window_rows_l_m, },
\ 'dark_mmm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_m, },
\ 'dark_mms_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_m, 'lines': g:window_rows_s_m, },
\ 'dark_msl_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_s, 'lines': g:window_rows_l_m, },
\ 'dark_msm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_s, 'lines': g:window_rows_m_m, },
\ 'dark_mss_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_s, 'lines': g:window_rows_s_m, },
\
\ 'dark_sxl_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_x, 'lines': g:window_rows_l_s, },
\ 'dark_sxm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_x, 'lines': g:window_rows_m_s, },
\ 'dark_sxs_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_x, 'lines': g:window_rows_s_s, },
\ 'dark_sll_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_l, 'lines': g:window_rows_l_s, },
\ 'dark_slm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_l, 'lines': g:window_rows_m_s, },
\ 'dark_sls_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_l, 'lines': g:window_rows_s_s, },
\ 'dark_sml_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_m, 'lines': g:window_rows_l_s, },
\ 'dark_smm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_s, },
\ 'dark_sms_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_m, 'lines': g:window_rows_s_s, },
\ 'dark_ssl_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_l, 'columns': g:window_columns_s, 'lines': g:window_rows_l_s, },
\ 'dark_ssm_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_m, 'columns': g:window_columns_s, 'lines': g:window_rows_m_s, },
\ 'dark_sss_gui'  : { 'colorscheme': g:colorscheme_name_dark, 'airline-theme': g:colorscheme_airline_name_dark, 'font-size': g:font_s, 'columns': g:window_columns_s, 'lines': g:window_rows_s_s, },
\
\ 'light_xxl_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_x, 'lines': g:window_rows_l_x, },
\ 'light_xxm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_x, 'lines': g:window_rows_m_x, },
\ 'light_xxs_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_x, 'lines': g:window_rows_s_x, },
\ 'light_xll_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_l, 'lines': g:window_rows_l_x, },
\ 'light_xlm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_l, 'lines': g:window_rows_m_x, },
\ 'light_xls_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_l, 'lines': g:window_rows_s_x, },
\ 'light_xml_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_m, 'lines': g:window_rows_l_x, },
\ 'light_xmm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_x, },
\ 'light_xms_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_m, 'lines': g:window_rows_s_x, },
\ 'light_xsl_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_s, 'lines': g:window_rows_l_x, },
\ 'light_xsm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_s, 'lines': g:window_rows_m_x, },
\ 'light_xss_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_s, 'lines': g:window_rows_s_x, },
\
\ 'light_lxl_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_x, 'lines': g:window_rows_l_l, },
\ 'light_lxm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_x, 'lines': g:window_rows_m_l, },
\ 'light_lxs_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_x, 'lines': g:window_rows_s_l, },
\ 'light_lll_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_l, 'lines': g:window_rows_l_l, },
\ 'light_llm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_l, 'lines': g:window_rows_m_l, },
\ 'light_lls_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_l, 'lines': g:window_rows_s_l, },
\ 'light_lml_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_m, 'lines': g:window_rows_l_l, },
\ 'light_lmm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_l, },
\ 'light_lms_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_m, 'lines': g:window_rows_s_l, },
\ 'light_lsl_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_s, 'lines': g:window_rows_l_l, },
\ 'light_lsm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_s, 'lines': g:window_rows_m_l, },
\ 'light_lss_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_s, 'lines': g:window_rows_s_l, },
\
\ 'light_mxl_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_x, 'lines': g:window_rows_l_m, },
\ 'light_mxm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_x, 'lines': g:window_rows_m_m, },
\ 'light_mxs_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_x, 'lines': g:window_rows_s_m, },
\ 'light_mll_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_l, 'lines': g:window_rows_l_m, },
\ 'light_mlm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_l, 'lines': g:window_rows_m_m, },
\ 'light_mls_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_l, 'lines': g:window_rows_s_m, },
\ 'light_mml_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_m, 'lines': g:window_rows_l_m, },
\ 'light_mmm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_m, },
\ 'light_mms_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_m, 'lines': g:window_rows_s_m, },
\ 'light_msl_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_s, 'lines': g:window_rows_l_m, },
\ 'light_msm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_s, 'lines': g:window_rows_m_m, },
\ 'light_mss_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_s, 'lines': g:window_rows_s_m, },
\
\ 'light_sxl_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_x, 'lines': g:window_rows_l_s, },
\ 'light_sxm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_x, 'lines': g:window_rows_m_s, },
\ 'light_sxs_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_x, 'lines': g:window_rows_s_s, },
\ 'light_sll_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_l, 'lines': g:window_rows_l_s, },
\ 'light_slm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_l, 'lines': g:window_rows_m_s, },
\ 'light_sls_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_l, 'lines': g:window_rows_s_s, },
\ 'light_sml_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_m, 'lines': g:window_rows_l_s, },
\ 'light_smm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_m, 'lines': g:window_rows_m_s, },
\ 'light_sms_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_m, 'lines': g:window_rows_s_s, },
\ 'light_ssl_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_l, 'columns': g:window_columns_s, 'lines': g:window_rows_l_s, },
\ 'light_ssm_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_m, 'columns': g:window_columns_s, 'lines': g:window_rows_m_s, },
\ 'light_sss_gui' : { 'colorscheme': g:colorscheme_name_light, 'background': 'light', 'airline-theme': g:colorscheme_airline_name_light, 'font-size': g:font_s, 'columns': g:window_columns_s, 'lines': g:window_rows_s_s, },
\ }

" Key mapping to change font size
nnoremap <S-F2> :let g:font_size=g:font_size-1<CR>:call SetTheme()<CR>
nnoremap <F2> :let g:font_size=g:font_size+1<CR>:call SetTheme()<CR>

" Key mapping to change the window height
nnoremap <M-{> :let g:window_height=g:window_height-1<CR>:call SetTheme()<CR>
nnoremap <M-}> :let g:window_height=g:window_height+1<CR>:call SetTheme()<CR>

" Key mapping to change the window width
nnoremap <M-[> :let g:window_width=g:window_width-1<CR>:call SetTheme()<CR>
nnoremap <M-]> :let g:window_width=g:window_width+1<CR>:call SetTheme()<CR>

" 'unimpaired' style key to switch the lights on/off.
nnoremap [al :let g:is_light=1<CR>:call SetTheme()<CR>
nnoremap ]al :let g:is_light=0<CR>:call SetTheme()<CR>

" }}}
