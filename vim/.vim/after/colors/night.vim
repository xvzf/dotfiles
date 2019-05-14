" ###########################################################################
" #                                                                         #
" # This file contains my personal vim night theme.                         #
" #                                                                         #
" # @package    dotfiles/vim                                                #
" # @filename   night.vim                                                   #
" # @author     Amir Heinisch <mail@amir-heinisch.de>                       #
" # @link       https://amir-heinisch.de                                    #
" # @version    1.0                                                         #
" #                                                                         #
" ###########################################################################

" TODO: implement on theme.

hi clear
if exists("syntax_on")
      syntax reset
  endif

runtime colors/Tomorrow-Night.vim
let g:colors_name = "night"

set background=dark
highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
