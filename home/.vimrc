set nocompatible               " be iMproved

" Scripts and bundles
syntax on
filetype off                   " required!

" Use the big space button.
let mapleader = " "
let maplocalleader = "  "

" I tend to use ` as my escape key in tmux.
" I find jumping of marks by 'a useless anyway so remap it.
nnoremap  '     `
nnoremap  `     '

" Improvements on basic and most used vim commands.
" I will suggest that if you are newbie, you do not use these
" mappings and rather learn the hard way. This will let you use vi(m)
" with no external settings and at places where you do not have your
" configs.
" <Leader>w writes the current buffer to disk.
map <Leader>w :w!<CR>
" <Leader>W writes the current buffer to disk and quits the window.
map <Leader>W :x!<CR>
" <Leader>q quits the current window
" I never ended up using it much as I hardly close windows and lot of times by
" mistake, I type q instead of w.
" map <Leader>q :q!<CR>
" <Leader>Q quits all windows.
" Turns out I might be doing mistake so no need to be that.
map <Leader>Q :qa<CR>
" Quickly open a file
map <Leader>o :e<space>
map <Leader>O :e <c-r>=expand("%:h")<CR>/

" General settings
set vb t_vb=
set encoding=utf-8
set autoindent
set hidden
set nobackup
set nowritebackup
set noswapfile
set number
set nopaste
set ruler
set scrolloff=3                  " Keep a margin of X lines when scrolling
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showmode
set laststatus=2                 " Always show the StatusLine
set nofoldenable

if exists('+colorcolumn')
  set colorcolumn=80
endif

set cursorline
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set wildmode=longest,list        " set tab completion to something bash-like,

"Make searching better
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" Hit <space> twice to clear highlights.
noremap <silent><Leader><Leader> :nohls<CR>

" ------------------------------------------------------------------------------
" STATUS LINE
" ------------------------------------------------------------------------------
set statusline=%02n:                                  " Buffer number
set statusline+=%F                                  " Filename and path
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},  " File encoding
set statusline+=%{&ff}]                            " File format
set statusline+=\ %y                               " Filetype
set statusline+=\ %m                               " Modified flag
set statusline+=\ %r                               " Read only flag
set statusline+=%=                                 " Left/right separator
set statusline+=\ %c,                              " Cursor column
set statusline+=\ %l/%L                            " Cursor line/total lines
set statusline+=\ %P                               " Percent through file

" Break lines
nnoremap <NL> i<CR><ESC>

" Till I figure out how to correctly get solarized working, its easier
" to change by one keystroke.
" Looks like I figured it out...
"map <F6>    :colorscheme zenburn<CR>

if has("gui_running")
  " This might not work in non mac vim as I never tried gVim.
  set guifont=Consolas:h12
	set guioptions-=T " No toolbar
  set background=dark
endif

"Edit & reload .vimrc
nnoremap <leader>rs :source ~/.vim/vimrc<CR>
nnoremap <leader>rt :tabnew ~/.vim/vimrc<CR>
nnoremap <leader>re :e ~/.vim/vimrc<CR>
nnoremap <leader>rd :e ~/.vim/ <CR>

" Toggle stuff
"nnoremap <leader><space> :noh<cr>
map <LEADER>R :set wrap! wrap?<CR>
map <LEADER>P :set paste! paste?<CR>

" Cycle through changelist
nmap <UP>   g;<CR>
nmap <DOWN> g,<CR>

" exit to normal mode with 'jj'
inoremap jj <ESC>

" sane movement with wrap turned on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"Teach me to do things right.
"nnoremap <up> <nop>
"nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Make H/J/K/L work like super versions of h/j/k/l - J/K go to start/end of
" buffer, and H/L go to start/end of line.
"noremap H ^
"noremap J gg
"noremap K G
"noremap L $

" F1 to be a context sensitive keyword-under-cursor lookup
nnoremap <F1> :help <C-R><C-W><CR>

" Reformat current paragraph
nnoremap Q mpgqap`p

" Make Q repeat the last recorded macro
"map Q @@
"
"Lot of times, I need to yank a text and dont be effected by normal update
"register. E.g. copy URL from a notes section to another section. (I tend to
"write notes an aggregate URL before sitting down to write the whole blog). This
"is useful.
"They don't work. Figure it out.
"map YY    "yY
"map YP    "yP
" Copy to Mac clipboard when needed
" For paste, we just use command-v in insert mode.
map  <leader>y    "*y

" search and replace word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" smart indent paste. Shown at #vim
nnoremap <Leader>p p'[=']

" generate helptags.
map <LEADER>JJ :helptags ~/.vim/doc<CR>

" window movement, splitting & resizing
map <LEADER>\ :vertical resize 85<CR>
nnoremap ss    <C-W>s
nnoremap vv    <C-W>v
" Its just easier then <C-W>q to reach
nnoremap <leader>wc <C-W>q
"nnoremap <leader>wr <C-W>r
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Figure out why these keys dont work.
" Maps Alt-[h,j,k,l] to resizing a window split
"map <silent> <A-h> <C-w><
"map <silent> <A-j> <C-W>-
"map <silent> <A-k> <C-W>+
"map <silent> <A-l> <C-w>>
"nmap WH :leftabove vnew<CR>
"nmap WJ :leftabove new<CR>
"nmap WL :rightbelow vnew<CR>
"nmap WK :rightbelow new<CR>

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" Switch back to the last buffer you were looking at.
"nnoremap <Leader>b  <C-^>
nnoremap <silent> Z  <C-^>
"nnoremap <Leader>b  <C-^>
nnoremap <Leader>l :ls<CR>:b<space>
nnoremap <left>     :bp<CR>
nnoremap <right>    :bn<CR>
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

" View routes or Gemfile in large split
map <leader>gr :topleft :split config/routes.rb<cr>
"map <leader>gg :topleft 100 :split Gemfile<cr>
"
" " Skip to Model, View or Controller
" Space is required
map <Leader>m :Rmodel
map <Leader>v :Rview
map <Leader>c :Rcontroller

" Some improvements to make MRU better.
nnoremap <Leader>b :MRU<CR>

"Only works for 7.3 so do brew install.
"http://stackoverflow.com/questions/677986/vim-copy-selection-to-os-x-clipboard
"It works but when you run vim from tmux, even YANK does not work.
"So if its terminal, just use the mouse and Apple-C till I figure out a better
"way.
"if exists('+unnamed')
  set clipboard=unnamed
"endif

" Better wrapping for common files
au FileType gitcommit set tw=72
au FileType {liquid,markdown,text} set tw=80
"au FileType markdown set tw=80
au FileType mail setl fo-=c

" Tokaen from: http://vim.wikia.com/wiki/Converting_variables_to_or_from_camel_case
" moving from rails to scala, I end up writing variables differently sometime.
" a quick hack.
map <LEADER>ss :setlocal spell!<cr>
map <leader>cc :s#_\(\l\)#\u\1#g<cr>

" Quickly fix spelling. 90% of the time its the case.
"map <C-space> 1z=

" ctags - add this later to it
" -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"  from: http://amix.dk/blog/post/19329
nmap <leader>tt :!/usr/bin/ctags -R --exclude=.git --exclude=log .<CR>

" copy filename
map <silent> <leader>. :let @*=expand('%:p').':'.line('.')<CR>
map <silent> <leader>/ :let @*=expand('%:p:h')<CR>
" copy path

"Git fugitive
"Display the git status.
"map <Leader>gs :Gstatus<CR>
"" Display the git log list
"map <Leader>gl :Glog<CR>
"" Display the diff
"map <Leader>gd :Gdiff<CR>
"" Run git blame
"map <Leader>gb :Gblame<CR>
"" Git push
"map <Leader>gp :Git push<CR>
"" Git pull
"map <Leader>gu :Git pull<CR>

map <Leader>gg  :Ggrep<space>
"autocmd QuickFixCmdPost *grep* cwindow

"Persistent undo
if exists('+undodir')
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=1000 "maximum number of changes that can be undone
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

map <Leader>jb  :JekyllBuild<CR>
map <Leader>jn  :JekyllPost<CR>
map <Leader>jl  :JekyllList<CR>

"let g:jekyll_post_dirs = ['$HOME/src/psykidellic.github.com/_posts', '_posts', '_source/_posts']
let g:jekyll_path = expand('$HOME/src/psykidellic.github.com')
let g:jekyll_post_published = "false"
let g:jekyll_post_template =  [
      \ '---',
      \ 'layout: post',
      \ 'published: false',
      \ 'title: "JEKYLL_TITLE"',
      \ 'date: "JEKYLL_DATE"',
      \ '---',
      \ '']

function! ReloadAll()
  :bufdo set eventignore-=Syntax | e!
endfunction

" Interesting using S-F5 didnt work on iterm/mvim.
" osse suggest using cat -v and using the keycode and it worked.
" Turned out tmux just does not recognise S-F5. You can verify it
" by starting tmux and doing cat -v and pressing Shift-F5. Nothing outputs
" but if you repeat the thing with F5, it does. So something with tmux that I
" need to figure out.
"map <F5>      :echo 'ritesh'
"map <esc>[15~      :echo 'keycode for f5'<CR>
"map <esc>[15;2~      :call ReloadAll()<CR>echo 'done'<CR>
"map <esc>[15;2~      :call ReloadAll()<CR>:echo 'ritesh'<CR>
"map <S-F5>            :echo 'ritesh'<CR>
"map <S-F5>            :call ReloadAll()<CR>
command! ReloadAll call ReloadAll()

function! BufferNumberMappings()
  for n in filter(range(1,bufnr('$')), 'buflisted(v:val) && v:key < 10')
    exec 'nore <leader>' . (n - 1) . ' :b '. n . '<CR>'
  endfor
endfunction

"au BufWritePost *.coffee silent CoffeeMake! --bare --compile
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Programming
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'derekwyatt/vim-scala'
Bundle 'kchmck/vim-coffee-script'
Bundle 'python.vim'
" autocmd BufWritePost *.coffee silent CoffeeMake! -b | cwindow

Bundle 'lunaru/vim-less'
Bundle 'tristen/vim-sparkup'

" Utility
Bundle 'tpope/vim-repeat'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'trailing-whitespace'
Bundle 'psykidellic/vim-jekyll'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-commentary'

if version >= 703
  Bundle 'myusuf3/numbers.vim'
  nnoremap <F3> :NumbersToggle<CR>
  nnoremap <F4> :NumbersOnOff<CR>
endif

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key='<LocalLeader>'

Bundle 'Indent-Guides'
let g:indent_guides_guide_size = 1

Bundle 'scrooloose/nerdtree'

" Colorscheme
Bundle 'altercation/vim-colors-solarized'
Bundle 'jnurmine/Zenburn'
Bundle 'tpope/vim-vividchalk'

" testing
Bundle 'bling/vim-airline'
" https://github.com/gmarik/vundle/issues/119#issuecomment-3089923
" Color
" I have a weird requirement for colorscheme. I would like to use
" solarized as much as possible but unfortunately weechat, newsbeuter
" color scheme dont work with solarized by default. So I end up using zenburn
" on my personal vps. I dont use it for anything other then checking my mails.
" twitter etc - I dont really need any coloescheme. Rest, I just use
" solarized.
" mutt renders alright with default colors everywhere and if I am not on my
" machine, I dont really need to be doing weechat/newsbeuter.
" ButIndent-Guides with zenburn terminal vim becomes impossible with solarized colorscheme
" and its pain to do <F6> everywehre.

" Some settinsg which seem to be applicable at different terminals
" but not on my iterm. So I leave it for reference later on.
set t_Co=256
set background=dark
"https://github.com/altercation/vim-colors-solarized/issues/40
call togglebg#map("")
"let g:solarized_termcolors=256
"let g:solarized_termtran=1

if match(hostname(), 'niara') > -1
  " colorscheme zenburn
else
  " colorscheme solarized
end

" For python we use 4
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

filetype plugin indent on
