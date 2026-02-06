set nocompatible
filetype on
filetype plugin indent on
syntax enable
set timeoutlen=1000
set tabstop=4
set shiftwidth=4
set expandtab
set rnu
set nu
set incsearch
set hlsearch
set autoindent
set ignorecase
let g:loaded_matchparen = 1
let g:markdown_folding = 1
set background=dark

if (has("termguicolors"))
    set termguicolors
endif

" ensure vim plug is installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PLUGINS
" --------------------------------------------------
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim')
"
" General
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish' " coerice word coversions crs, crc, etc
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline' " status line
Plug 'RRethy/vim-illuminate' " highlight same words under cursor
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'michaeljsmith/vim-indent-object'
call plug#end()

colo gruvbox

" PLUGIN SETTINGS


" MAPPINGS
" --------------------------------------------------
let mapleader=","

nnoremap <leader>t :NERDTreeFind<cr>

" Make split wider/narrower
nnoremap <leader>a <c-w>10>
nnoremap <leader>s <c-w>10<

nnoremap <leader><esc> :set nohls<cr>
nnoremap <leader>o :FZF<enter>
nnoremap <leader>f :RG<enter>

noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

nnoremap L Lzz
nnoremap H Hzz

" This function makes ripgrepping behave like how finding in jetbrains works
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

