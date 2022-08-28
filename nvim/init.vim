let mapleader=" "

set number relativenumber
set title
set bg=dark
set mouse=a
set incsearch
set nohlsearch
set scrolloff=1
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
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
call plug#end()

colorscheme gruvbox

" NetRW settings
let g:netrw_winsize = 18
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
nnoremap <C-n> :Lex<CR>

" Cntrl T to switch between tabs
nnoremap <C-t> gt
nnoremap <C-T> gT

" Map S to ys
nmap S ys

" Split Navigation
map <C-j> <C-w>w
map <C-k> <C-w>W

" Disable Auto-Comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Enable Auto-Complete in Command Mode
set wildmode=longest,list,full

" When shortcut files are updated, renew configs with new material:
autocmd BufWritePost bm-files,bm-dirs !shortcuts
" When init.vim file is updated, source the file after saving it:
" autocmd BufWritePost init.vim source %

" Insert Lines Without Going into Insert Mode
nmap <leader>o o<esc>
nmap <leader>O O<esc>

" Check spellings:
map <leader>s :setlocal spell! <CR>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "%:p"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout "%:p"<CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" fun! TrimWhitespace()
" 	let l:save = winview()
" 	keeppatterns %s/\s\+$//e
" 	call winrestview(l:save)
" endfun

" augroup ADHWAID
" 	autocmd!
" 	autocmd BufWritePre * :call TrimWhitespace()
" augroup end

" Move stuff around in visual mode up or down a line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" Changing VimWiki's directory
let g:vimwiki_list = [{'path': '~/.local/share/vimwiki', 'path_html':'~/.local/share/mywiki_html'}]

source ~/.config/nvim/shortcuts.vim
