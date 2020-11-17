" ---------------------------------
" Neovim configuration
" Version: 1.4
" Date: 2020-11-17
" Author: Juan Pablo Quiroga
" Based in jdhao blog https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
" --------------------------------

set encoding=utf-8

" View line numbers
set number relativenumber
syntax enable
set noswapfile

" Scroll when are less than x lines
set scrolloff=7
set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

let mapleader=' '

set foldmethod=indent
set foldlevel=99

" **************
" MAPS keys
" **************

" Remap keys for tabs

" Crtl-Left and Crtl-Right
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Crtl-Shift-Up and Crtl-Shift-Down to move lines
noremap <C-s-Up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
noremap <C-s-Down> ddp

" Tab for autocompletion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" NerdTree toggle crtl-p
nnoremap <silent> <C-p> :NERDTreeToggle<CR>
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Tabs
nmap <C-x> :bd<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

noremap <leader>e :Files<CR>

" ********************
" Configurations
" ********************

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Deoplete
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline_theme='powerlineish' " <theme> is a valid theme name
let g:airline_powerline_fonts = 1

" JEDI
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" Neomake
let g:neomake_python_enabled_makers = ['pylint']

" **********************
" PLUGINS
" **********************
call plug#begin('~/.local/share/nvim/plugged')

" Jedi for code jump
Plug 'davidhalter/jedi-vim'

" Deoplete for autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Airline for status linebar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Automatic quote and bracket completion
Plug 'jiangmiao/auto-pairs'

" Comment lines
Plug 'scrooloose/nerdcommenter'

" Format code
Plug 'sbdchd/neoformat'

" To directory navigation
Plug 'scrooloose/nerdtree'

" Linting code
Plug 'neomake/neomake'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Highlight selection
Plug 'machakann/vim-highlightedyank'

" Auto fold
"Plug 'tmhedberg/SimpylFold'

" Syntax colors
Plug 'morhetz/gruvbox'

" Git integration
Plug 'airblade/vim-gitgutter'

" Git 
Plug 'tpope/vim-fugitive'

" Fuzzy logic search, needed to install fzf and silver-search previously 
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Syntax verification
Plug 'vim-syntastic/syntastic'

" Code structures
Plug 'vim-scripts/taglist.vim'

" Icons for nerdtree
Plug 'ryanoasis/vim-devicons'

" Colorize css colors
Plug 'norcalli/nvim-colorizer.lua'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Indent Guides
Plug 'nathanaelkane/vim-indent-guides'

Plug 'mhinz/vim-startify'

Plug 'liuchengxu/vim-which-key'

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

Plug 'easymotion/vim-easymotion'

call plug#end()


" ************************
" neomake auto code check
" ************************
call neomake#configure#automake('nrwi', 500)

" *******************
" Color scheme 
" *******************
colorscheme gruvbox
set background=dark " use dark mode

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

if (has("termguicolors"))
    set termguicolors
endif

lua require 'colorizer'.setup()

" Tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamednode=':t'

