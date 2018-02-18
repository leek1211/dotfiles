" .vimrc
"
" maintained by Posquit0.BJ <poqsuit0.bj@gmail.com>
" http://www.poqsuit0.com/

""" + General
" Make Vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Number of things to remember in history
set history=256
" Time to wait after ESC (default causes an annoying delay)
set timeoutlen=250
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard+=unnamed
" Optimize for fast terminal connections
set ttyfast
" Enable mouse in all modes
set mouse=a
" Hide the mouse cursor while typing
set mousehide
" Map <leader> key
let mapleader=","
let g:mapleader=","
" Walk directory tree upto $HOME looking for tags
set tags=./tags;$HOME
" Don’t add empty newlines at the end of files
set binary
" automatically change window's cwd to file's dir
set autochdir
set autoindent

"" Folding
" Trun on folding
set foldenable
" Make folding indent sensitive
set foldmethod=indent
" Don't autofold anything
set foldlevel=99
" Don't open folds when search into them
set foldopen-=search
" Don't open folds when undo stuff
set foldopen-=undo

"" Backup and swap
" Centralize backups, swapfiles and undo history
" set backupdir=~/.vim/backups
" set directory=~/.vim/swaps
" if exists("&undodir")
"   set undodir=~/.vim/undo
" endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*

"" Modeline
" Respect modeline in files
set modeline
set modelines=4

"" Match and search
" Highlight searches
" set hlsearch
" Ignore case of searches
set ignorecase
" be sensitive when there's a capital letter
set smartcase
" Highlight dynamically as pattern is typed
set incsearch 
""" - General

""" + Encoding
set enc=utf-8
set fencs=utf-8,euc-kr
""" - Encoding

""" + Formatting
" Allow backspace in insert mode
set backspace=indent,eol,start

" Set the default tabstop
set tabstop=2
set softtabstop=2
" Set the default shift width for indents
set shiftwidth=2
" Make tabs into spaces (set by tabstop)
set expandtab
" Smarter tab levels
set smarttab
""" - Formatting

""" + Visual
" Enable 256 colors in vim
set t_Co=256
" Line numbers on
set number
" Show the command typing
set showcmd
" Show matching brackets
set showmatch
" Bracket blinking
set matchtime=5
" No blinking
set novisualbell
" No noise
set noerrorbells
" Always show status line.
set laststatus=2
" Show ruler
set ruler
" Show the current mode
set showmode
" Enable syntax highlighting
syntax on
" Highlight current line 
set cursorline
""" - Visual

""" + Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
""" - Windows

filetype indent on    " required
" required

call plug#begin('~/.vim/plugged')

Plug 'L9'
Plug 'tpope/vim-git'
Plug 'shougo/vimproc.vim'
Plug 'sjl/gundo.vim'
" Map GundoToggle to <F12>
nnoremap <silent> <F12> :GundoToggle<CR>
" Set the horizontal width of Gundo graph
let g:gundo_width=40
" Force the preview window below current windows
let g:gundo_preview_bottom=1
" Set 1 to open the right side instead of the left
let g:gundo_right=0
" Disable Gundo entirely if machine not support python
if v:version < '703' || !has('python')
  let g:gundo_disable=1
endif
" Rendering diff automatically with cursor move
let g:gundo_auto_preview=1
"
Plug 'scrooloose/nerdtree'
" Map NERDTreeToggle to <F11>
nnoremap <silent> <F11> :NERDTreeToggle<CR>
" Ignore some extensions
let NERDTreeIgnore=['.o$','.pyc$']
" Automatically open NERDTree when vim start up with no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
""" - Plug: NERD Tree
Plug 'vim-airline/vim-airline-themes'
""" + Plug: Airline
" Use statusline more effective
Plug 'bling/vim-airline'
" let g:airline_powerline_fonts=1
let g:airline_theme='sol'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=""
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline_section_b="%{strftime('%H:%M:%S')}"
let g:airline_section_y="[%{&fileformat}/%{strlen(&fenc)?&fenc:&enc}]"
" Use airline's showmode
set noshowmode
""" - Plug: Airline

Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": [],
                           \ "passive_filetypes": ["scala"] }

Plug 'flazz/vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key='<C-g>'
let g:multi_cursor_prev_key='<C-S-g>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

Plug 'wakatime/vim-wakatime'

call plug#end()


colorscheme molokai
