set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'                  "coerice word coversions crs, crc, etc
Plugin 'tpope/vim-commentary'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'plasticboy/vim-markdown'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-speeddating'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'RRethy/vim-illuminate'
Plugin 'elixir-editors/vim-elixir'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
" set timeoutlen=500
set tabstop=4
set shiftwidth=4
set expandtab
set rnu
set nu
set incsearch
set hlsearch
set autoindent

colorscheme candycode

let g:loaded_matchparen = 1

" Mappings
inoremap jk <esc>
inoremap kj <esc>
map <Space> <Plug>(easymotion-bd-w)
map <leader>N :NERDTreeToggle<cr>

nnoremap <c-l> <c-w>10>
nnoremap <c-h> <c-w>10<

nnoremap <leader><esc> :set nohls<cr>

map <leader>n :NERDTreeToggle<CR>
nmap <leader>N :NERDTreeFind<CR>

imap <c-h> <c-y>,

" block cursor in command more
" ----------------------------
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
" ----------------------------

" find in files
let s:grepExcludes = "--exclude=*.swp --exclude=*.svn-base --exclude=*.un~ --exclude=tags --exclude=log --exclude=node_modules/* --exclude=coverage/*"
command! -nargs=1 Grepr call FindInFilesFunc(<f-args>)
nmap <c-h> :Grepr <c-r><c-w>
"imap <c-h> <esc>:Grepr <c-r><c-w>

function! FindInFilesFunc(term)
    let filename = expand('%:t')
    let defaultPattern = "*." . strpart(filename, matchend(filename, '.*\.'))
    let includePattern = input('--include=? ', defaultPattern)
    if includePattern == ''
        let includePattern = '*'
    endif

    execute 'grep! -rn --binary-files=without-match '. s:grepExcludes . ' "' . a:term . '" --include=' . includePattern . ' *'
    cw
endfunction


" VCoolor settings
nmap <leader>c :VCoolor<cr>

" YouCompleteMe
let g:ycm_language_server = 
  \ [ 
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ '/path/to/yaml/server/yaml-language-server', '--stdio' ],
  \     'filetypes': [ 'yaml' ]
  \   },
  \   {
  \     'name': 'rust',
  \     'cmdline': [ 'ra_lsp_server' ],
  \     'filetypes': [ 'rust' ],
  \     'project_root_files': [ 'Cargo.toml' ]
  \   },
  \   {
  \     'name': 'godot',
  \     'filetypes': [ 'gdscript' ],
  \     'port': 6008,
  \     'project_root_files': [ 'project.godot' ]
  \    }
  \ ]
