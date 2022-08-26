"----PLUGINS----"

" Install vim-plug if we don't already have it
" Credit to github.com/captbaritone
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir -p ~/.vim/plugged'
    execute '!mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Reload .vimrc and :PlugInstall to install plugins.
" Go check ~/.vim/autoload/plug.vim for more info on vim-plug
call plug#begin('~/.vim/plugged')

" Theming
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 42 Header
Plug '42Paris/42header'
let g:user42 = 'jfrancai'
let g:mail42 = 'jfrancai@student.42.fr'

call plug#end()

"----GLOBAL SETTINGS----"

" Use Vim settings rather than Vi settings
set nocompatible


"----TEXT RENDERING OPTIONS----"

" Use an encoding that supports Unicode
set encoding=utf-8

" Reload a file when it is changed from the outside
set autoread

" Write the file when kwe leave the buffer
set autowrite


"----SWAP AND BACKUP FILE OPTIONS----"

set noswapfile
set nobackup
set nowb


"----GENERAL CONFIGURATION OPTIONS----" 

" Allow backspacing over indention, line breaks and insertions start
set backspace=eol,indent,start

" Allow bigger history of excuted commands
set history=1000

" Set bigger history of executed commands
set showcmd

" Show current mode
set showmode

" Minimal amount of line under and above the cursor
set scrolloff=5

" Show current line number
set number

" Hide buffers instead of closing them
set hidden

" Color scheme
colorscheme jellybeans

" Display command line's tab complete options as a menu
set wildmenu

" Highlight cursor line
set cursorline

" Enable syntax highlighting
syntax on

" Use colors that suit a dark background
set background=dark

" Set the window title, reflecting the file currently being edited
set title

" Mouse mode activated
set mouse=a

" Search down into subfolders
set path+=**

" Change style of whitespace characters if set list activated
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤
set fillchars=vert:│


"----INDENTATIONS OPTIONS----"

" New line inherit the indentation of previous lines
set autoindent

" Show existing tab with 4 (default value 8) spaces width
set tabstop=4

set shiftwidth=4

" Don't wrap lines
set nowrap


"----SEARCH OPTIONS----"

" Find the next match as we type the search
set incsearch

" Highlight searches by default
set hlsearch

" Ignore case when searching...
set ignorecase

" ...unless you type a capital
set smartcase

"----STATUS LINE----"

" Always display status line
set laststatus=2

" Custom status line
" set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)


"----MAPPINGS----"

" Auto curly braces
inoremap {<CR> {<CR>}<C-o>O

" Double esc auto turn off hlsearch when research is ended
nnoremap <esc><esc> :silent! nohls<cr>

" Read template file
nnoremap ,c :-1read $HOME/.vim/.skeleton/sk.c<CR>3jo

" Ctrl + j : current word replaced by :registers 0 
:map <C-j> cw<C-r>0<ESC>

" Directory listing style
let g:netrw_liststyle = 3

" Default window for netrw window 
let g:netrw_browse_split = 4

" Default width for netrw window
let g:netrw_winsize = 30

"----CTAGS----"

command! MakeTags silent! !ctags -R . &
autocmd BufWritePost .c,.h silent! !ctags -R . &
