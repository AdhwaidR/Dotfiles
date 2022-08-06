let mapleader=" "

set number relativenumber
set title
set bg=light
set mouse=a
set incsearch
set nohlsearch
set clipboard+=unnamedplus
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set guicursor+=a:blinkon1 "Different cursors in different modes
set splitbelow splitright

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
call plug#end()

" NerdTree Keybinds
nnoremap <C-n> :NERDTreeToggle<CR>

" Cntrl T to switch between tabs
nnoremap <C-t> gt
nnoremap <C-T> gT

" Split Navigation
map <C-j> <C-w>w
map <C-k> <C-w>W

" Disable Auto-Compment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Enable Auto-Complete in Command Mode
set wildmode=longest,list,full

" When shortcut files are updated, renew configs with new material:
autocmd BufWritePost bm-files,bm-dirs !shortcuts
" When init.vim file is updated, source the file after saving it:
autocmd BufWritePost init.vim source %

" Insert Lines Without Going into Insert Mode
nmap <leader>o o<esc>
nmap <leader>O O<esc>

" Check spellings:
map <leader>s :setlocal spell! <CR>

" Compile python programs
nmap <leader>c :!setsid -f st -e python % <CR> <CR>

" Changing VimWiki's directory
let g:vimwiki_list = [{'path': '~/.local/share/vimwiki', 'path_html':'~/.local/share/mywiki_html'}]

source ~/.config/nvim/shortcuts.vim
