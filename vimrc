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
Plugin 'git://git.wincent.com/command-t.git'
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
" Lokaltog/powerline
Plugin 'Lokaltog/powerline'
" one colorscheme pack to rule them all!
Plugin 'flazz/vim-colorschemes'
" Vim plugin to visualize your Vim undo tree
Plugin 'sjl/gundo.vim'
" Vim plugin for the_silver_searcher, 'ag', a replacement for the Perl module
" / CLI script 'ack'
Plugin 'rking/ag.vim'
" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'kien/ctrlp.vim'

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

" Colors.
"colorscheme desertEx
colorscheme badwolf
"colorscheme molokai
syntax enable " enable syntax processing.

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
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual auto complete for command menu
"set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" Searching
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

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
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV `[v`]

" Leader Shortcuts
let mapleader=","       " leader is comma
" jk is escape
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" edit vimrc/zshrc/bashrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>eb :vsp ~/.bashrc<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" save session
"nnoremap <leader>s :mksession<CR>

" Powerline settings
set encoding=utf-8 " Necessary to show Unicode glyphs
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2   " Always show the statusline
set t_Co=256
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" NERDTree
let NERDTreeIgnore = ['\.pyc$', 'build', 'venv', 'egg', 'egg-info/', 'dist','docs']

" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Backups
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" Spell checking settings.
set spell
" No spell checking for idl files.
autocmd BufRead,BufNewFile *.pro setlocal nospell

" Vim-LaTeX settings
set shellslash
set grepprg=grep\ -nH\ $*
map <Leader>lx :<C-U>call SetXeTex()<CR>
set iskeyword+=:

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
