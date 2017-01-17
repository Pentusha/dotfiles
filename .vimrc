" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" be iMproved, required for Vundle
set nocompatible              
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Save read only files with sudo
cmap w!! w !sudo /usr/bin/tee > /dev/null %

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, 
" instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" Plugin 'flazz/vim-colorschemes'
Plugin 'dsolstad/vim-wombat256i'
set t_Co=256
hi LineNr ctermfg=grey
" color wombat256mod move to end of file

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set relativenumber
set number
au BufReadPost * set relativenumber
set tw=99          " width of document (used by gd)
set nowrap         " don't automatically wrap on load
set fo-=t          " don't automatically wrap text when typing
set colorcolumn=100
highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" ============================================================================
" Useful stuff
" ============================================================================
Plugin 'fisadev/vim-isort'
let g:vim_isort_map = '<C-i>'

Plugin 'mileszs/ack.vim'

Plugin 'majutsushi/tagbar'
nnoremap <silent> <F9> :TagbarToggle<CR>

Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'jmcantrell/vim-virtualenv'

Plugin 'kchmck/vim-coffee-script'

Plugin 'ElmCast/elm-vim'

Plugin 'jewes/Conque-Shell'
let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_Color = 1
let g:ConqueTerm_ToggleKey = '<F8>'
let g:ConqueTerm_ExecFileKey = '<F11>'

" ============================================================================
" Airline
" ============================================================================
Plugin 'bling/vim-airline'
" wget mv PowerlineSymbols.otf ~/.fonts/://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
" wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
" fc-cache -vf ~/.fonts/
" mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
let g:airline_powerline_fonts = 1
" ============================================================================
" VCS install
" ============================================================================
Plugin 'phleet/vim-mercenary'

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
Plugin 'Lokaltog/vim-powerline.git'
set laststatus=2


" Settings for ctrlp
Plugin 'kien/ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*coverage/*
set wildignore+=*venv/*
set wildignore+=*.tox/*

" Settings for jedi-vim
Plugin 'davidhalter/jedi-vim'
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python inspections
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers=['python', 'flake8', 'pep257']


map <buffer> <F10> :SyntasticCheck<CR>

" Python folding
Plugin 'tarmack/vim-python-ftplugin'
set nofoldenable

" https://blag.felixhummel.de/vim/django_completion.html
if filereadable($VIRTUAL_ENV . '/.vimrc')
  source $VIRTUAL_ENV/.vimrc
endif

call vundle#end()

colorscheme wombat256i
