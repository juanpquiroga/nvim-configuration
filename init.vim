" ---------------------------------
" Neovim configuration
" Version: 1.2
" Date: 2020-11-16
" Author: Juan Pablo Quiroga
" Based in jdhao blog https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
" --------------------------------

" View line numbers
set nu

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
