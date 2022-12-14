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
set exrc

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
" let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_list_hide="\.pdf$, \.jpe?g$, \.png$ "
nnoremap <C-n> :Lex<CR>

" Cntrl T to switch between tabs
	nnoremap <C-t> gt
	nnoremap <C-T> gT

" Map S to ys (surround plugin)
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
	nmap <leader>o o<esc>k
	nmap <leader>O O<esc>j

" Check spellings:
	map <leader>s :setlocal spell! <CR>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler "%:p"<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout "%:p"<CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Move stuff around in visual mode up or down a line
	vnoremap J :m '>+1<CR>gv=gv
	vnoremap K :m '>-2<CR>gv=gv

" Shell like bindings for insert mode
imap <C-d> <C-o>de
imap <C-b> <C-o>b
imap <C-f> <C-o>w
imap <C-a> <C-o>^
imap <C-e> <C-o>$
imap <C-x> <C-o>x

" Changing VimWiki's directory & Syntax
let g:vimwiki_list = [{'path': '~/.local/share/vimwiki', 'path_html':'~/.local/share/mywiki_html', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Filetypes
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

source $HOME/.config/nvim/shortcuts.vim
