call plug#begin()

Plug 'github/copilot.vim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'catppuccin/nvim'
Plug 'tpope/vim-commentary'
Plug 'farmergreg/vim-lastplace'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

filetype plugin indent on

colorscheme catppuccin

let g:python_highlight_all = 1

set number
set colorcolumn=100
set scrolloff=10
set tabstop=4
set shiftwidth=4
set foldmethod=indent
set foldlevel=100
set nofoldenable
set noswapfile
set cursorcolumn

autocmd FileType gitcommit setlocal colorcolumn=50,72

" Exit insert mode
imap jj <esc>

" Find files
nmap <c-p> :Telescope find_files <cr>

" Find text
nmap <c-f> :Telescope live_grep  <cr>

" Comments
nmap <c-_> gcc
vmap <c-_> gc

" Tab navigation
nmap <c-n> :tabnew               <cr>
nmap <Tab> :tabnext              <cr>

" Duplicate line below
nmap <c-d> :t.                   <cr>

" Select all
nmap <c-a> ggVG

"""""""""" lua
""""""""""

lua << EOF
require('gitsigns').setup()
require('lualine').setup()
EOF
