set nocompatible        "required

" Highlight 
let python_highlight_all = 1 
syntax enable 
set nu

set encoding=utf-8

" Set the runtime path to include and initialize Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" General
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'jnurmine/Zenburn'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" Programming
Plugin 'vim-syntastic/syntastic'
Bundle 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary'
Plugin 'chrisbra/csv.vim'
Plugin 'glench/vim-jinja2-syntax'

" Python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'

" Wiki
Plugin 'chikamichi/mediawiki.vim'
Plugin 'aquach/vim-mediawiki-editor'

" Git
Plugin 'tpope/vim-fugitive'

call vundle#end()

filetype off
filetype plugin on
filetype plugin indent on

" General settings

set ruler
set cursorline
set showmatch
set nobackup
set nowritebackup
set noswapfile
set clipboard=unnamed       " System clipboard

"" Split navigation
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
" au BufNewFile,BufRead *.py
"	\ set tabstop=4 |
"	\ set softtabstop=4 |
"	\ set shiftwidth=4 |
"	\ set textwidth=79 |
"	\ set expandtab |
"	\ set autoindent |
"	\ set fileformat=unix

" JS, HTML and CSS indentation
au BufNewFile,BufRead *.js,*.html,*.css
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe
set completeopt-=preview

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Netrw
let g:netrw_banner = 0                     " No infobox
let g:netrw_list_hide = '.*\.swp$,.*\.pyc' " Ignore files
let g:netrw_browse_split = 2 
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
let g:netrw_altv = 1
""" Temporarily disabled
"ugroup ProjectDrawer
"	autocmd!
"	autocmd VimEnter * :Vexplore
"augroup END


" Wiki
let g:mediawiki_editor_username = "Ivanhercaz"
let g:mediawiki_editor_path = "/w/"

" Colorscheme
set t_Co=256
syntax enable
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Goyo
let g:goyo_width = 85
let g:goyo_height = 80

" Limelight
let g:limelight_conceal_ctermfg = "gray"
let g:limelight_default_coefficient = 0.7
let g:limelight_priority = -1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
" Error symbols 
let g:syntastic_error_symbol = "✗✗"
let syntastic_style_error_symbol = "✗✗"
let g:syntastic_warning_symbol = "∙∙"
let syntastic_style_warning_symbol = "∙∙"

let g:syntastic_check_on_wq = 0 
let g:syntastic_python_checkers = ["flake8"]

" CSV
let g:csv_delim = ","
let g:csv_strict_columns = 1
let g:csv_highlight_column = "y"
let b:csv_fixed_width="1,5,9,13,17,21"
