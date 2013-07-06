" -------------------------------------------------------------------------------------------------------------------------------
" General
" -------------------------------------------------------------------------------------------------------------------------------

" reload vimrc automatically
if has("autocmd")
    autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" pathogen commands to disable packages
let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'cvim')

call pathogen#infect()      " enables pathogen

set nocompatible	        " dont make vim vi compatible at expense of new functionality
set history=700		        " set how many lines of history VIM has to remember

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" -------------------------------------------------------------------------------------------------------------------------------
" VIM User Interface
" -------------------------------------------------------------------------------------------------------------------------------

set wildmenu		" use a scrollable menu for filename completions
set incsearch		" makes search act like search in modern browsers
set hlsearch		" highlight all matching search results

set number		    " line numbering
set ruler		    " show cursor position at all time

set showfulltag		" get function usage help automatically
set showmatch		" show matching parantheses/brackets
set showmode		" show current vim mode


set completeopt=longest,menuone,menu,preview


" This function is for toggling between relative and local numbering
function! g:ToggleRelativeNumber()
    if &relativenumber
        setlocal number
    else
        setlocal relativenumber
    endif
endfunction

nnoremap <silent><leader>nu :call g:ToggleRelativeNumber()<CR>

au BufWinLeave * silent! mkview     " save folds when existing automatically
au BufWinEnter * silent! loadview   " load folds when entering automatically

" -------------------------------------------------------------------------------------------------------------------------------
"  Colors and Highlighting
" -------------------------------------------------------------------------------------------------------------------------------

set background=dark
syntax on		    " text highlighting

" -------------------------------------------------------------------------------------------------------------------------------
" Text, Tab and Indent Related
" -------------------------------------------------------------------------------------------------------------------------------

set smartindent		" context sensitive autoindent
set autoindent		" auto indenting on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set tw=79

" -------------------------------------------------------------------------------------------------------------------------------
" Uncategorized
" -------------------------------------------------------------------------------------------------------------------------------

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
set wildmode=list:longest

"set list

"nnoremap <up> <nop>
"inoremap <up> <nop>
"nnoremap <down> <nop>
"inoremap <down> <nop>
"nnoremap <left> <nop>
"inoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <right> <nop>


" -------------------------------------------------------------------------------------------------------------------------------
" Custom Commands
" -------------------------------------------------------------------------------------------------------------------------------
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>


"inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>

" nnoremap <C-W> h :H


nnoremap <leader>nt :NERDTree<CR>
autocmd vimenter * NERDTree

vnoremap <leader>s :sort<CR>        " sort lines
vnoremap < <gv " better indentation " indent and keep highlighting
vnoremap > >gv " better indentation " indent and keep highlighting

" Remove highlighting from last search
nnoremap <C-n> :nohl<CR>

nmap <leader>v :tabedit $MYVIMRC<CR>    " open vimrc file for editing
