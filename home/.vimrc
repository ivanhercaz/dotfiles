set nocompatible  "required
filetype off      "required

" Highlight 
let python_highlight_all = 1
syntax on
set nu

set encoding=utf-8

" Set the runtime path to include and initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" General
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Programming
Plugin 'vim-syntastic/syntastic'
Bundle 'Valloric/YouCompleteMe'

" Python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'

call vundle#end()

filetype plugin indent on

" Split navigation
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding
set foldmethod=indent
set foldlevel=99

" Spacebar to fold
nnoremap <space> za 

let g:SimpylFold_docstring_preview=1

" Pending to move to move to ftypes plugin
" Python indentation (PEP 8)
au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

" JS, HTML and CSS indentation
au BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Netrw
let g:netrw_banner = 0                     " No infobox
let g:netrw_list_hide = '.*\.swp$,.*\.pyc' " Ignore files
let g:netrw_browser_split = 2
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_altv = 1
" augroup ProjectDrawer
"	autocmd!
"	autocmd VimEnter * :Vexplore
" augroup END

" Powerline
set laststatus=2
set term=xterm-256color
set termencoding=utf-8
let g:Powerline_symbols = "fancy"

" Colorscheme
colorscheme zenburn
