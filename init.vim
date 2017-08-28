call plug#begin('~/.vim/plugged')

" Appearance
Plug 'morhetz/gruvbox'

" File types, languages
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'slim-template/vim-slim'
Plug 'w0rp/ale' " Linting
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-multiple-cursors'



" Other
"let g:deoplete#enable_at_startup = 1
Plug 'Shougo/deoplete.nvim'
"let g:deoplete#enable_at_startup = 1

Plug 'Shougo/unite.vim' " dependency for vimfiler
Plug 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'jiangmiao/auto-pairs' " pairs for ({''}) etc
let g:AutoPairsCenterLine = 0 " dont move screen when <CR>
let g:AutoPairsFlyMode = 1

Plug 'tpope/vim-fugitive' " git
"Plug 'junegunn/gv.vim' " requires vim-fugitive, :GV - open commit browser



call plug#end()


" Ale config
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1



" Enable deoplete
"call deoplete#enable()
let g:deoplete#enable_at_startup = 1

" Required:
filetype plugin indent on
syntax enable

" Genaral
set number
set nowrap

" Editing
set tabstop=2 " number of spaces that a <Tab> in the file counts for
set shiftwidth=2
"set softtabstop=2 " number of spaces that a <Tab> counts for while performing
		  " editing operations, like inserting a <Tab> or using <BS>
set expandtab " use spaces instead of tabs

" Searching
set ignorecase

" Appearance
set termguicolors
set background=dark
let g:gruvbox_contrast_dark='soft'
silent! colorscheme gruvbox

" Completion
set completeopt=longest,menuone,preview " show completion

" Other
set undofile
set directory=~/.vim/tmp " dir to place swap files in
set undodir=~/.vim/undo
set cmdheight=2
set splitright splitbelow

" Functions
function! CurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        echo "> ???"
        "return ''
    else
        echo ">" name
        "return '[' . name . ']'
    endif
endfunction

" Show extraspaces and tabs
highlight ExtraWhitespace guibg='#af4241'
match ExtraWhitespace /\s\+\%#\@<!$\| \t\+\%#\@<!/ " spaces and tabs


" Key bindings
let mapleader=","
nnoremap ; :

" prevent entering in visual mode
map Q <Nop>
" highlight search
nmap <silent> ,n :set invhls<CR>:set hls?<CR>
" buffers
map gt :bn<cr>
map gT :bp<cr>
map td :BD<cr>

map <silent><F12> :VimFiler <cr>
map <silent><C-F11> :VimFiler -find<cr>
map <C-P> :FZF<cr>

