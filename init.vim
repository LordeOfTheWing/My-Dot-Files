" Default Settings

:set encoding=UTF-8
:set completeopt=menuone,noinsert,noselect
:set autoindent
:set ignorecase
:set incsearch
:set number
:set nobackup
:set nowritebackup
:set updatetime=750
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set scrolloff=10
:set confirm
" :set spell
:set backspace=indent,eol,start
" :set cmdheight=1
:set hls is
:set colorcolumn=81
:set expandtab
:set laststatus=2 
:set cursorline
:set guicursor=i:block

" Plugins 

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting Out Code gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar For Code Navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'yggdroot/indentline' " Shows Line Guides On The Indentation Level
Plug 'mbbill/undotree' " Keeps Track Of All Changes Done In A File
Plug 'tomasiser/vim-code-dark' " Vscode Dark+ Theme
Plug 'pangloss/vim-javascript' " Javascript Syntax Highlighting
Plug 'itchyny/vim-gitbranch'  " Shows The Current Branch Of The Files Getting Tracked With Github
Plug 'szw/vim-maximizer' " Used To Increase The Size Of A Window In The Terminal
Plug 'kassio/neoterm' " Enables The Launch Of A Terminal In The Vim Working Environment
Plug 'itchyny/lightline.vim' " Styles The Vim Taskbar 
Plug 'neovim/nvim-lspconfig' " Language-Server-Support And Linting
Plug 'nvim-lua/completion-nvim' " Autocompletion


call plug#end()

" Key Mappings And Bindings

" Primeagen
if executable('rg')
    let g:rg_derive_root='true'
endif

"NerdTree Config
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

"Tagbar Config
nmap <F8> :TagbarToggle<CR>

" Vim Colorscheme
:colorscheme codedark

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Wincmd
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader> ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>

" Indenting
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


" Moving text around
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Light-line
let g:lightline = { 
    \ 'active': {
    \    'left': [ ['mode', 'paste'],
    \              ['gitbranch', 'readonly', 'filename', 'modified'] ]
    \ },
    \ 'component_function':{
    \    'gitbranch': 'gitbranch#name',
    \ },
    \'colorscheme': 'codedark',
    \ }

" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 60 
let g:neoterm_autoinsert = 1
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <Esc>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>

" tpope/vim-fugitive
nnoremap <leader>gg :G<cr>

" lsp-config
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach}

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references<CR>
nnoremap <silent> gR <cmd>lua vim.lsp.buf.rename<CR>








