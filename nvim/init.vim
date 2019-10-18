" .88b  d88.  .d88b.  d88888b db    db d888888b .88b  d88.
" 88'YbdP`88 .8P  Y8. 88'     88    88   `88'   88'YbdP`88
" 88  88  88 88    88 88ooooo Y8    8P    88    88  88  88
" 88  88  88 88    88 88~~~~~ `8b  d8'    88    88  88  88
" 88  88  88 `8b  d8' 88.      `8bd8'    .88.   88  88  88
" YP  YP  YP  `Y88P'  Y88888P    YP    Y888888P YP  YP  YP   V1.6.1
"
"         [========== A Lewd VIM Config ==========]
"
" Created by Tredix


" Basic configuration
syntax on
filetype plugin indent on
filetype off
set title
set number
set cursorline
set hlsearch
set wrap
set smartcase
set incsearch
set smartindent
set softtabstop=4
set ruler
set hidden
set autoread
set cursorline
set expandtab
set wildmenu
set splitbelow
set splitright

" Disable backups
set noswapfile
set nobackup

" Enable directory autocompletion
set wildmode=longest,list,full

" Add support for system clipboard
set clipboard=unnamed

" Encoding and true color support
set encoding=utf-8
set t_Co=256

" Remove trailing whitespaces when saving
autocmd BufWritePost * %s/\s\+$//e

" Open .vimrc file
command Config e /home/tredix/.config/nvim/init.vim

" Copy, Cut & Paste
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" Split buffers
map <C-N> <C-W><C-S>
map <C-M> <C-W><C-V>

" Move between splits
nmap <C-Left>    :wincmd h<CR>
nmap <C-Down>    :wincmd j<CR>
nmap <C-Up>      :wincmd k<CR>
nmap <C-Right>   :wincmd l<CR>

" Resize splits
nnoremap <silent> - :resize -5<CR>
nnoremap <silent> + :resize +5<CR>

nnoremap <silent> > :vertical resize -5<CR>
nnoremap <silent> < :vertical resize +5<CR>

" Switch between buffers
map <A-n> :bn<CR>
map <A-p> :bp<CR>

" Close a buffer
map <C-x> :bd<CR>

" Launch terminal
map <C-T> :vsplit term://bash<CR>

" Fix for st
if &term =~ '256color'
    set t_ut=
endif

" Automatic commands
autocmd BufWritePost ~/.Xresources !xrdb ~/.Xresources
autocmd BufWritePost ~/.config/compton.conf !killall compton && compton & disown
autocmd BufWritePost ~/.config/bspwm/bspwmrc !bspc wm -r
autocmd BufWritePost ~/.config/sxhkd/sxhkdrc !killall sxhkd && sxhkd & disown
autocmd BufWritePost ~/.config/polybar/config !~/.config/polybar/launch.sh & disown

" Plug + Plugins
call plug#begin()
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ivalkeen/nerdtree-execute'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-jp/vim-java'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
call plug#end()
filetype plugin indent on

" Colorscheme
set termguicolors
colorscheme vice

" Java syntax highlight
let g:java_highlight_functions = 1

" Allow italics
let g:one_allow_italics = 1

" NERDTree
map <C-o> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:webdevicons_conceal_nerdtree_brackets=0

let g:airline_theme='vice'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#tab_min_count = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#obsession#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#obsession#indicator_text = '◘'
let g:airline#extensions#tabline#enabled = 1

" Goyo
map <C-g> :Goyo<CR>

" VimWiki Syntax
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
