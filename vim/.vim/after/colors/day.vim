" ###########################################################################
" #                                                                         #
" # This file contains my personal vim day theme.                           #
" #                                                                         #
" # @package    dotfiles/vim                                                #
" # @filename   day.vim                                                     #
" # @author     Amir Heinisch <mail@amir-heinisch.de>                       #
" # @link       https://amir-heinisch.de                                    #
" # @version    1.0                                                         #
" #                                                                         #
" ###########################################################################

" TODO: Implement own theme.

hi clear
if exists("syntax_on")
      syntax reset
  endif

runtime colors/Tomorrow.vim
let g:colors_name = "day"

"hi StatusLine guifg=black guibg=white
"hi StatusLineNC guifg=LightCyan guibg=blue gui=bold
