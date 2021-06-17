set nocompatible
filetype on
filetype plugin indent on
syntax enable
set timeoutlen=500
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
colo gruvbox

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
Plug 'dense-analysis/ale' " linting
Plug 'habamax/vim-godot'
Plug 'morhetz/gruvbox'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()


" PLUGIN SETTINGS

let g:deoplete#enable_at_startup = 1

" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

" Allow ALE to autoimport completion entries from LSP servers
let g:ale_completion_autoimport = 1

" Register LSP server for Godot:
call ale#linter#Define('gdscript', {
\   'name': 'godot',
\   'lsp': 'socket',
\   'address': '127.0.0.1:6008',
\   'project_root': 'project.godot',
\})

call deoplete#custom#option('candidate_marks',
            \ ['A', 'S', 'D', 'F', 'G'])
inoremap <expr>A       pumvisible() ?
            \ deoplete#insert_candidate(0) : 'A'
inoremap <expr>S       pumvisible() ?
            \ deoplete#insert_candidate(1) : 'S'
inoremap <expr>D       pumvisible() ?
            \ deoplete#insert_candidate(2) : 'D'
inoremap <expr>F       pumvisible() ?
            \ deoplete#insert_candidate(3) : 'F'
inoremap <expr>G       pumvisible() ?
            \ deoplete#insert_candidate(4) : 'G'


inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


" MAPPINGS
" --------------------------------------------------
let mapleader=","

nnoremap <leader>t :NERDTreeFind<cr>

" Make split wider/narrower
nnoremap <c-l> <c-w>10>
nnoremap <c-h> <c-w>10<

nnoremap <leader><esc> :set nohls<cr>
nnoremap <leader>o :FZF<enter>
nnoremap <leader>f :RG<enter>



" This function makes ripgrepping behave like how finding in jetbrains works
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

