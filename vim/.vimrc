" vim-plug auto-install (thanks to mthomas!)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" general settings
set laststatus=2 "always show status line
set colorcolumn=80 "eighty-collumn-line
set number
set relativenumber
set cursorline
set nowrap
set showmatch
set noshowmode
set noshowcmd
set encoding=utf-8
set backspace=indent,eol,start
set wildmenu
set scrolloff=5
set undolevels=1337
set mouse=a

"search
set ignorecase "case ignore
set smartcase "if search contains case, take it into account
set hlsearch "highlight search result
set noincsearch "don't jump to first match while typing

"indentation
set autoindent
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent

"cursor
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

"netrw
let g:netrw_winsize = 25  " width
let g:netrw_liststyle = 3 " Tree-like structure
let g:netrw_banner = 0    " Remove useless banner at the top of netrw

"syntax highlighting
syntax enable

"highlight superfluous whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\v\s+$| +\ze\t|\S\zs\t+ +|^\s*( {32})+/

call plug#begin('~/.vim/plugged')
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
"  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ericbn/vim-solarized'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sainnhe/everforest'
  Plug 'tpope/vim-fugitive'
  Plug 'edkolev/tmuxline.vim'
call plug#end()

"color theme
if has('termguicolors')
  set termguicolors
endif
let g:everforest_enable_italic = 1
"let g:everforest_transparent_background = 1
let g:everforest_better_performance = 1
let g:everforest_background = 'hard'
"hi Normal guibg=NONE ctermbg=NONE
colorscheme everforest
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" vim-airline
let g:airline_theme="everforest"
let g:airline#extensions#tabline#enabled = 1 "enables the list of buffers
let g:airline#extensions#tabline#formatter = "unique_tail_improved"
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" airline symbols
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#close_symbol = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.colnr = ':'
let g:airline_symbols.linenr = '  :'
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.notexists = '  '
let g:airline_symbols.dirty = ' '
let g:airline#extensions#tabline#tabs_label = '裡'
let g:airline#extensions#tabline#buffers_label = '﬘'
let g:airline_mode_map = {
    \ 'i'      : '',
    \ 'ic'     : '',
    \ 'ix'     : '',
    \ 'n'      : '',
    \ 'multi'  : '並',
    \ 'ni'     : '',
    \ 'no'     : '',
    \ 'R'      : 'ﰇ',
    \ 'Rv'     : 'ﰇ',
    \ 'v'      : '',
    \ 'V'      : ' ',
    \ ''     : ' 麗',
    \ 'c'      : ''
    \ }

" Keymappings
map <C-t> :tabnew .<CR>
