if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " == Navigation
  call dein#add('preservim/nerdtree')
  call dein#add('itchyny/vim-cursorword')
  call dein#add('mhinz/vim-startify')
  call dein#add('/usr/local/opt/fzf')
  call dein#add('junegunn/fzf.vim')
  call dein#add('tpope/vim-surround')
  call dein#add('easymotion/vim-easymotion')
  call dein#add('christoomey/vim-tmux-navigator')

  " == Writing
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')

  " == Language support
  call dein#add('fatih/vim-go')
  call dein#add('google/vim-jsonnet')

  " == Autocomplete, Snippets
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
  call dein#add('preservim/nerdcommenter')
  " call dein#add('neoclide/coc-snippets')

  " == Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " == Appearence
  call dein#add('sheerun/vim-polyglot')
  call dein#add('Yggdroot/indentLine')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('sonph/onehalf', {'rtp': 'vim'})
  call dein#add('vim-airline/vim-airline')


  call dein#end()
  call dein#save_state()
endif

