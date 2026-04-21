" vim-plug auto-install (thanks to marcothms!)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" general settings
set laststatus=2 "always show status line
set colorcolumn=100
set number
set relativenumber
set cursorline
set nowrap
set showmatch
set noshowmode
set noshowcmd
set encoding=utf-8
set backspace=indent,eol,start
set wildmenu "autocomplete :e
set scrolloff=5
set undolevels=1337
set mouse=a "a: active/c: inactive
set confirm "save necessary for quit
set noswapfile
set ttimeoutlen=5 "make esc snappy

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
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ericbn/vim-solarized'
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'sainnhe/everforest'
    Plug 'tpope/vim-fugitive'
    Plug 'edkolev/tmuxline.vim'
    Plug 'dense-analysis/ale'
    if strlen(system('which kitty')) > 0
        Plug 'fladson/vim-kitty'
    endif
    if strlen(system('which caddy')) > 0
        Plug 'isobit/vim-caddyfile'
    endif
    Plug 'lepture/vim-jinja'
    if strlen(system('which ruby')) > 0
        Plug 'tpope/vim-rails'
    endif
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

"color theme
if has('termguicolors')
  set termguicolors
endif
let g:everforest_enable_italic = 1
"let g:everforest_transparent_background = 1
let g:everforest_better_performance = 1
let g:everforest_background = 'medium'
let g:darkmode=0
if empty(glob('~/.darkmode'))
    set background=light
else
    set background=dark
    let g:darkmode=1
endif
"hi Normal guibg=NONE ctermbg=NONE
colorscheme everforest
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" make undercurl work
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
" make italics work
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"" vim-airline settings
let g:airline_theme='everforest'
" tabline
let g:airline#extensions#tabline#enabled = 1 "enables the list of buffers
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_buffers = 0
" airline-git
let g:airline#extensions#branch#enabled = 1
" airline-whitespace
let g:airline#extensions#whitespace#enabled = 1
" airline-ale
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#show_line_numbers = 1
" airline-tmuxline
let g:airline#extensions#tmuxline#enabled = 0

" ale
let g:ale_sign_priority=30
let g:ale_echo_msg_format = ' %severity%  %linter%  %s'
let g:ale_set_highlights=1
highlight ALEError gui=undercurl guifg=NONE guibg=NONE ctermbg=NONE cterm=undercurl ctermul=red term=underline
highlight ALEWarning gui=undercurl guifg=NONE guibg=NONE ctermbg=NONE cterm=undercurl ctermul=yellow term=underline
if empty(glob('~/.darkmode'))
    highlight ALEErrorLine guibg='white'
    highlight ALEWarningLine guibg='white'
else
    highlight ALEErrorLine guibg='black'
    highlight ALEWarningLine guibg='black'
endif

" git
let g:gitgutter_sign_priority=9

"" tmuxline
let g:tmuxline_powerline_seperators = 1
" symbols
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt' : '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}

"" airline symbols
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_symbols.colnr = ':'
let g:airline_symbols.linenr = '  :'
let g:airline_symbols.maxlinenr = ' '
" airline-separators
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" tabline
let g:airline#extensions#tabline#close_symbol = ''
let g:airline#extensions#tabline#tabs_label = '裡'
let g:airline#extensions#tabline#buffers_label = '﬘'
let g:airline#extensions#tabline#overflow_marker = ' ••• '
" airline-git
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.notexists = '  '
let g:airline_symbols.dirty = ' '
" airline-modes
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
" airline-whitespace
let g:airline#extensions#whitespace#symbol = ' '
" airline-ale (async lint engine)
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#ale#open_lnum_symbol = ':  '
let g:airline#extensions#ale#close_lnum_symbol = ''

" symbols
" ale
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_echo_msg_error_str = ' '
let g:ale_echo_msg_warning_str = ' '
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

" Functions
function! SetDarkTheme()
    execute 'set background=dark'
    execute 'AirlineTheme everforest'
    let g:darkmode=1
endfunction
function! SetLightTheme()
    execute 'set background=light'
    execute 'AirlineTheme everforest'
    let g:darkmode=0
endfunction
function! ToggleDarkLight()
    if g:darkmode==1
        call SetLightTheme()
    else
        call SetDarkTheme()
    endif
endfunction

" Keymappings
nnoremap <C-t> :tabnew .<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-q> :vsplit<CR>:q<CR>

" Custom commands
command SetDark :call SetDarkTheme()
command SetLight :call SetLightTheme()
command ToggleDark :call ToggleDarkLight()

" File specific actions
autocmd BufRead *.README :set spell textwidth=72 colorcolumn=72
autocmd BufRead *COMMIT_EDITMSG :set textwidth=72 colorcolumn=72
