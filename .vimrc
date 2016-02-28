set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'wincent/Command-T'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
" A tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'
" Vim motion on speed
Plugin 'Lokaltog/vim-easymotion'
" The ultimate vim statusline utility. DEPRECATED in favor of
" " Lokaltog/powerline
" Plugin 'Lokaltog/powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" one colorscheme pack to rule them all!
Plugin 'flazz/vim-colorschemes'
" Vim plugin to visualize your Vim undo tree
Plugin 'sjl/gundo.vim'
" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module
" / CLI script 'ack'
Plugin 'rking/ag.vim'
" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'kien/ctrlp.vim'
" Seamless navigation between tmux panes and vim splits
Plugin 'christoomey/vim-tmux-navigator'
" Flake8 plugin for Vim
Plugin 'nvie/vim-flake8'
" surround.vim: quoting/parenthesizing made simple
Plugin 'tpope/vim-surround'
" comment stuff out
Plugin 'tpope/vim-commentary'
" " A code-completion engine for Vim
" Plugin 'Valloric/YouCompleteMe'
" Light Vim color scheme inspired by Google's Material Design
Plugin 'NLKNguyen/papercolor-theme'
" A vim plugin to display the indention levels with thin vertical lines 
Plugin 'Yggdroot/indentLine'
" A modern vim plugin for editing LaTeX files.
" Plugin 'lervag/vimtex'
Plugin 'jscappini/material.vim'
" snipMate.vim aims to be a concise vim script that implements some of
" TextMate's snippets features in Vim
Plugin 'msanders/snipmate.vim'
" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'
" Perform all your vim insert mode completions with Tab
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Spaces & Tabs
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set shiftwidth=4
set modelines=1
filetype indent on      " load filetype-specific indent files
set autoindent

" UI Config
set number              " show line numbers
set relativenumber       " show relative line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual auto complete for command menu
"set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Searching
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
"" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]

" Leader Shortcuts
let mapleader=","       " leader is comma
"" jk is escape
"inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc/zshrc/bashrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>eb :vsp ~/.bashrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session
"nnoremap <leader>s :mksession<CR>

" " Powerline settings
" set encoding=utf-8 " Necessary to show Unicode glyphs
" python import sys; sys.path.append("$HOME/anaconda/lib/python2.7/site-packages/")
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
" set laststatus=2 " Always display the statusline in all windows
" " set showtabline=2 " Always display the tabline, even if there is only one tab
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" set t_Co=256
" let g:Powerline_symbols = 'fancy'
" set fillchars+=stl:\ ,stlnc:\

" vim-airline setting
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set laststatus=2
" let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.crypt = '🔒'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.notexists = '∄'
" let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" NERDTree
let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist','docs']

"" allows cursor change in tmux mode
"if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"else
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"endif
"
" Backups
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" Vim-LaTeX settings
set shellslash
set grepprg=grep\ -nH\ $*
map <Leader>lx :<C-U>call SetXeTex()<CR>
set iskeyword+=:
let g:tex_flavor='latex'
let g:Tex_UseMakefile=0
" let g:Tex_ViewRule_pdf='mupdf-x11'

function! FixLastSpellingError()
    normal! mm[s1z=`m
endfunction
nnoremap <leader>sp :call FixLastSpellingError()<cr>

" Toggle auto-indenting for code paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Git commit message settings
autocmd Filetype gitcommit setlocal spell textwidth=72

nnoremap <leader>sop :source %<cr>

" Colors.
colorscheme badwolf
" colorscheme material
" set t_Co=256
" colorscheme PaperColor
" colorscheme molokai
" colorscheme monokain
" colorscheme summerfruit256
" colorscheme harlequin
" colorscheme seti
" set background=dark
syntax enable " enable syntax processing.

" Spell checking settings.
set spell
" No spell checking for idl files.
autocmd BufRead,BufNewFile *.pro setlocal nospell
hi clear SpellBad
hi SpellBad cterm=underline

" Completion
set complete+=kspell

"" Fortran settings
"nmap <S-F> :set syntax=fortran<CR>:let b:fortran_fixed_source=!b:fortran_fixed_source<CR>:set syntax=text<CR>:set syntax=fortran<CR>
"nmap <C-F> :filetype detect<CR>

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72

set backspace=indent,eol,start
let g:tex_conceal = ""
