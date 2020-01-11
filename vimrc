" basic all encompassing

set t_co=256
set nocompatible               " be improved
syntax enable                  " enable syntax processing
set tabstop=4                  " number of visual spaces per tab
set softtabstop=4              " number of spaces in tab when editing
set expandtab                  " tabs are spaces
set autoindent         	       " turns it on
set smartindent                " does the right thing (mostly) in programs
set shiftwidth=4               " indenting is 4 spaces
set tw=0                       " dont wrap lines
set number
set hidden                     " allows you to switch between unsaved buffer
set rnu
filetype plugin indent on

" Use the big space button.
let mapleader = " "
let maplocalleader = "  "

" cursors movements
set colorcolumn=80             " shows a border at 80. i like to auto indent
set cursorline
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set wildmode=longest,list        " set tab completion to something bash-like,
" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" teach me to do things right.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

map <LEADER>R :set wrap! wrap?<CR>   " alternate between wrap and no wrap

" Reformat current paragraph
nnoremap Q mpgqap`p
" select all CTRL-A adds count so its useful
nnoremap vA ggVG

" some yank improvements
" Y behave like D or C
nnoremap Y y$
" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" https://vi.stackexchange.com/questions/84/how-can-i-copy-text-to-the-system-clipboard-from-vim
vnoremap <Leader>y "*y
noremap <Leader>p "*p

" replace currently selected text with default register
" without yanking it
" vnoremap <leader>p "_dP

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
noremap <silent><Esc><Esc> :nohls<CR>

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
map <Leader>O :e <c-r>=expand("%:h")<CR>/

" Window, buffer management, movement
nnoremap ss    <C-W>s
nnoremap vv    <C-W>v

" last buffer
nnoremap <silent> Z  <C-^>
" list of buffers
nnoremap <Leader>l :Buffers<CR>
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
nnoremap <silent> <leader>f :Files<CR>
nnoremap <leader>/ :Rg<space>
nnoremap <leader>fd :Rg <C-R><C-W>

" Backups and undos {{{
nnoremap <leader>U :UndotreeToggle<CR>
set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set undofile
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
"}}}


call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive' " git plugin
Plug 'fatih/vim-go' " go
Plug 'ntpeters/vim-better-whitespace' " complete whitespace traversal
Plug 'tpope/vim-commentary' " simple commands to comment block of code
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree' " nerdtree to jump

Plug 'tomasiser/vim-code-dark'
Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install  --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'Shougo/deoplete.nvim'
Plug 'majutsushi/tagbar'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-obsession'
Plug 'mbbill/undotree'

let g:rg_command = 'rg --vimgrep -S'

" Add plugins to &runtimepath
call plug#end()

" load syntax theme
" This has to be at end after plugend
colorscheme codedark

" options for plugins
map <C-n> :NERDTreeToggle<CR>
nnoremap <LEADER>tb :TagbarToggle<CR>

" sessions
let session_dir = expand($HOME . '/.vim/sessions/')
if !isdirectory(session_dir)
    call mkdir(session_dir, 'p')
endif

nnoremap <Leader>ss :execute "Obsession " . session_dir . fnamemodify(getcwd(), ':t')<CR>
nnoremap <Leader>sl :wall<Bar>execute "source " . session_dir . fnamemodify(getcwd(), ':t')<CR>

" filetype based stuff
" for golang
" golang autocomplete doepete is required based on docs
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
" This is required as part of deoplete and vim-hug-neovim-rpc
set encoding=utf-8
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
" let g:go_fmt_autosave = 0


" Enable deoplete
let g:deoplete#enable_at_startup = 1
