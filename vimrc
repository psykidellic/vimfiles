" basic all encompassing

set t_Co=256
set nocompatible               " be iMproved
syntax enable                  " enable syntax processing
set tabstop=4                  " number of visual spaces per TAB
set softtabstop=4              " number of spaces in tab when editing
set expandtab                  " tabs are spaces
set noswapfile
set autoindent         	       " turns it on
set smartindent                " does the right thing (mostly) in programs
set shiftwidth=4               " indenting is 4 spaces
set tw=0                       " dont wrap lines
set number
set hidden                     " allows you to switch between unsaved buffer
set rnu
filetype plugin indent on

" cursors movements
set colorcolumn=80             " Shows a border at 80. I like to auto indent
set cursorline
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set wildmode=longest,list        " set tab completion to something bash-like,
" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Teach me to do things right.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

map <LEADER>P :set paste! paste?<CR> " alternate between paste and not paste
map <LEADER>R :set wrap! wrap?<CR>   " alternate between wrap and no wrap

" Reformat current paragraph
nnoremap Q mpgqap`p

" Use the big space button.
let mapleader = " "
let maplocalleader = "  "

" exit to normal mode with 'jj'
inoremap jj <ESC>
-
" Make searching better
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Hit <space> twice to clear highlights.
noremap <silent><Leader><Leader> :nohls<CR>

" Edit & reload .vimrc
nnoremap <leader>rs :source ~/.vim/vimrc<CR>
nnoremap <leader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <leader>re :e ~/.vim/vimrc<CR>
nnoremap <leader>rd :e ~/.vim/ <CR>

" Convert between normal number and relative number
silent! autocmd InsertEnter * :set number
silent! autocmd InsertLeave * :set relativenumber

" <Leader>w writes the current buffer to disk.
map <Leader>w :w!<CR>
" <Leader>W writes the current buffer to disk and quits the window.
map <Leader>W :x!<CR>
" Quickly open a file
map <Leader>o :e<space>

" Window, buffer management, movement
nnoremap ss    <C-W>s
nnoremap vv    <C-W>v

" last buffer
nnoremap <silent> Z  <C-^>
" list of buffers
nnoremap <Leader>l :ls<CR>:b<space>
nnoremap <Leader>1  :1b<CR>
nnoremap <Leader>2  :2b<CR>
nnoremap <Leader>3  :3b<CR>
nnoremap <Leader>4  :4b<CR>
nnoremap <Leader>5  :5b<CR>
nnoremap <Leader>6  :6b<CR>
nnoremap <Leader>7  :7b<CR>
nnoremap <Leader>8  :8b<CR>
nnoremap <Leader>9  :9b<CR>
nnoremap <Leader>0  :10b<CR>

" fzf and ripgrep
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>g :Rg<space>

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive' " git plugin
Plug 'fatih/vim-go' " go
Plug 'ntpeters/vim-better-whitespace' " complete whitespace traversal
Plug 'tpope/vim-commentary' " simple commands to comment block of code
Plug 'scrooloose/nerdtree' " nerdtree to jump

Plug 'tomasiser/vim-code-dark'
Plug 'bling/vim-airline'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
let g:rg_command = 'rg --vimgrep -S'

" Add plugins to &runtimepath
call plug#end()

" load syntax theme
" This has to be at end after plugend
colorscheme codedark

" options for plugins
map <C-n> :NERDTreeToggle<CR>

" filetype based stuff
" for golang
au filetype go inoremap <buffer> . .<C-x><C-o> " autocomplete
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
