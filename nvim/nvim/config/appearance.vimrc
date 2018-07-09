" ========================================================
" Color theme configuration

set termguicolors
set listchars=tab:•\ ,trail:•,extends:»,precedes:«
set ruler
set number
set relativenumber number

let g:neosolarized_contrast = "normal"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "high"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
" let g:neosolarized_vertSplitBgTrans = 1

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

set noshowmode

" AYU color scheme
" IndentLine {{
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
let ayucolor="light"

colorscheme ayu
" colorscheme NeoSolarized
" colorscheme OceanicNext
" set background=dark

" let g:lightline = {
"       \ 'colorscheme': 'PaperColor',
"       \ }

let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ }
