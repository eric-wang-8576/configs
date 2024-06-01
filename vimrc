set nocompatible

call plug#begin()
call plug#end()

let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1

syntax enable
set background=dark
set viminfo="1000"
colorscheme codedark
set re=0

filetype on
filetype plugin on
filetype indent on

" do not indent for makefiles
au FileType make set noexpandtab

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set showmatch
set autoindent

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Disable highlight when <leader><cr> is pressed
map <silent> <SPACE> :noh<cr>

hi Search ctermbg=Blue
set hls " Highlight search options
set incsearch " Incremental search
set smartcase " Allow case-sensitive search if there is one uppercase
set ignorecase

set scrolloff=5

" syntax enable

set ic " Default to case-insensitive search
set cursorline " Highlight current line
hi CursorLine ctermbg=NONE cterm=underline " No color, just underline
set wildmode=longest,list " On tab filename complete, first tab produces longest. Second tab produces list.

set backspace=indent,eol,start " Allow backspacing over indent, eol, start
set laststatus=2 " Set status line as second-to-last line
set statusline=%F%m%r%w\ %=\ [%l,%c]\ \ \ %p%%

" easier to get to beginning and end of lines
noremap ; $

" Remap kj and jk while in insert mode to ESC
inoremap kj <ESC>
inoremap jk <ESC>

" Improved up/down scrolling on wrapped lines
nnoremap j gj
nnoremap k gk

set ttymouse=xterm2
set mouse=a

noremap <silent> <C-Down> <C-w>j
noremap <silent> <C-Up> <C-w>k
noremap <silent> <C-Left> <C-w>h
noremap <silent> <C-Right> <C-w>l

augroup AutoReloadVimRC
    au!
    " automatically reload vimrc when it's saved
    au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

set autochdir " Automatically change current working directory to most recent file
set number
highlight ColorColumn ctermbg=3
set colorcolumn=800

:2mat ErrorMsg '\s\+$'

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    hi def link cppFuncDef Special
endfunction

autocmd Syntax cpp call EnhanceCppSyntax()

" ================================= folding ====================================

set foldenable
set foldlevelstart=99
set foldnestmax=10
set foldmethod=manual
set textwidth=800

function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-X>\<C-I>"
    endif
endfunction

inoremap <Tab> <C-R>=CleverTab()<CR>
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

nnoremap <F5> :call TrimWhitespace()<CR>

" increase history
set history=700

set clipboard=unnamed

" Tags
set tags=./tags;,tags;
nnoremap ]t :tnext <CR>
nnoremap [t :tprev <CR>
nnoremap [s :tselect <CR>
nnoremap ]s :tselect <CR>

" Commenting
function! Comment()
    silent s:^:\/\/:g
endfunction

function! Uncomment()
    silent s:^\/\/::g
endfunction

map <C-g> :call Comment()<CR>
map <C-b> :call Uncomment()<CR>
