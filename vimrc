set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Themes
Plugin 'tjammer/blayu.vim'
Plugin 'kamykn/skyknight'

" Interface and Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Syntax and Languages
Plugin 'jelera/vim-javascript-syntax'
Plugin 'posva/vim-vue'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Valloric/YouCompleteMe'

" Other
Plugin 'vim-scripts/CSApprox'
Plugin 'SirVer/ultisnips'

call vundle#end()            " required
filetype plugin indent on    " required

" Airline
let g:airline_theme = 'dark_minimal'
let g:airline#extensions#branch#enabled = 1
let g:airline_skip_empty_sections = 1

" NERD Tree specific
autocmd vimenter * NERDTreeTabsToggle
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * wincmd p
let g:NERDTreeIgnore=['^\.', '\~$', '^\~']
let g:nerdtree_tabs_open_on_new_tab = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_autofind = 1
let g:nerdtree_tabs_open_on_console_startup = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 30
let g:NERDTreeShowHidden = 0

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
let g:ycm_complete_in_comments = 0
let g:ycm_complete_in_strings = 0
let g:ycm_enable_diagnostic_highlighting = 0
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_key_list_stop_completion = ['<CR>']

" Visual Settings
syntax on
set ruler
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
"set autoindent             " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set splitbelow              " make all horizontal splits below
set cursorline
set mouse=a
set confirm
set history=1000
set autochdir
set wildmenu

if has("gui_running")
else
    let g:CSApprox_loaded = 1
endif

set title
set titleold="Terminal"
set titlestring=%F

" Set THEME
set t_Co=256
colorscheme skyknight 
hi Visual term=bold ctermbg=Blue guibg=Grey

""""""""""""""""
" Mappings
""""""""""""""""

" Toggle NERD Tree pane
nmap <C-b> :NERDTreeTabsToggle<CR>

" Fast open vim/nvim rc file
noremap <silent> :config :edit $MYVIMRC<CR>

" Close tab and all its windows
nnoremap <silent> <C-x> :tabclose<CR>

" Go to previous tab
nnoremap <C-p> :tabprev<CR>

" Go to next tab
nnoremap <C-n> :tabnext<CR>

" Create/Open new tab
nnoremap <S-Tab> :tabnew<CR>

" Prevent Ctrl+s terminal freeze and save file instead
" For this to work put this line in ~/.bashrc or ~/.zshrc
inoremap <C-s> <Esc>:w<CR>

" Open terminal window (:terminal) in a split window below current
nnoremap <C-\> <Esc>:set termwinsize=10x0<CR>:below terminal<CR>

" Close/Toggle opened terminal window (:terminal)
tnoremap <C-\> <C-\><C-n>:q!<CR>

" Split window horizontally
nnoremap <C-Down> :sp<CR>

" Split window vertically
nnoremap <C-Right> :vs<CR>

" Move to below split window
nnoremap <S-Down> <C-W><C-J>

" Move to above split window
nnoremap <S-Up> <C-W><C-K>

" Move to right split window
nnoremap <S-Right> <C-W><C-L>

" Move to left split window
nnoremap <S-Left> <C-W><C-H>

" Close split
nnoremap <C-Q> <C-W><C-Q>

" Move split into its own tab
nnoremap <C-w> <C-W><S-T>

" Auto-format entire file and move the cursor to its position
noremap <F2> gg=<S-G>``

" Snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Default snippets folder relative to the runtime folder $HOME/.vimrc
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
