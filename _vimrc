runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
cd ~

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

syntax on                       " enable syntax processing
filetype plugin indent on       " load filetype plugins/indent settings

" 01) Important {{{
set nocompatible                " turn off Vi compatibility
set cpoptions=aABceFsmq         " list of flags to specify VI compatibility
" --- END --- Important }}}

" 02) Moving around, searching, and patterns {{{
set ignorecase                  " ignore case when using a search pattern
set incsearch                   " show match for partly typed search command
set magic                       " change the way backslashes are used in search patterns
set smartcase                   " override 'ignorecase' when pattern has upper case characters
set nostartofline               " don't move cursor
set whichwrap=b,s,h,l,<,>,~,[,] " list of flags specifying which commands wrap to another line (local to window)
" --- END --- Moving around, search, and patterns }}}

" 03) Displaying text {{{
set lazyredraw                  " don't redraw while executing macros
set list                        " show <Tab> as ^I and end-of-line as $
set listchars=tab:>=,trail:.    " list of strings used for list mode
set number                      " show the line number for each line
set numberwidth=6               " number of columns to use for the line number
set scroll=11                   " number of lines to scroll for CTRL-U and CTRL-D
set scrolloff=10                " number of lines to show around the cursor
set sidescrolloff=10            " minimal number of columns to keep left and right of the cursor
set nowrap                      " long lines do not wrap
" --- END --- Displaying text }}}

" 04) Syntax, highlighting, and spelling {{{
set cursorcolumn                " highlight the screen column of the cursor
set cursorline                  " highlight the screen line of the cursor
set hlsearch                    " highlight all matches for the last used search pattern

" --- END --- Syntax highlighting, and spelling }}}

" 05) Multiple windows {{{
set hidden                      " don't unload a buffer when no longer shown in a window
set laststatus=2                " when to use a status line for the last window
" --- END --- Multiple windows }}}}

" 06) Multiple tab pages {{{
set showtabline=2               " when to use a tab pages line
set tabpagemax=15               " maximum number of pages to open for -p and "tab all"
" --- END --- Multiple tab pages }}}

" 07) Using the mouse {{{
set mouse=a                     " list of flags for using the mouse
set mousefocus                  " the window with the mouse pointer becomes the current one
set mousehide                   " hide the mouse pointer while typing
set mousemodel=popup            " what the right mouse button is used for
" --- END --- Using the mouse }}}

" 08) GUI {{{
set background=dark             " the background color brightness
set guifont=Consolas:h10        " list of font names to be used in the GUI
set linespace=0                 " number of pixel lines to use between characters

colorscheme molokai             " set the colorscheme
                                " badwolf - https://github.com/sjl/badwolf/
                                " solarized - https://github.com/altercation/Vim-colors-solarized
                                " molokai - https://github.com/tomasr/molokai

hi folded term=standout guifg=#A6E22E guibg=#454545
" --- END --- GUI }}}

" 09) Messages and info {{{
set more                        " don't pause listings when the screen is full
set report=0                    " threshold for reporting changed lines
set ruler                       " show the cursor position below each window
set showcmd                     " show partial command keys in the status line
set showmode                    " display the current mode in the status line
set shortmess=aOstT             " list of flags to make messages shorter
set novisualbell                " do not use a visual bell instead of beeping
" --- END --- Messages and info }}}

" 10) Selecting text {{{
set clipboard=unnamed           " share windows clipboard
set selectmode=mouse            " when to start select mode instead of Visual mode
" --- END --- Selecting text }}}

" 11) Editing text {{{
set backspace=indent,eol,start  " specifies what <BS>, CTRL-W, etc. can do in Insert mode
set completeopt=menuone         " whether to use a popup menu for Insert mode completion
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s* " pattern to recognize a numbered list
set formatoptions=rqn           " list of flags that tell how automatic formatting works
set infercase                   " adjust case of a keyword completion match
set matchpairs=(:),{:},[:],<:>  " list of pairs that match for the "%" command
set matchtime=5                 " tenth of a second to show a match for 'showmatch'
set showmatch                   " when inserting a bracket, briefly jump to its match
set textwidth=78                " line length above which to break a line
" --- END --- Editing text }}}

" 12) Tabs and indenting {{{
set autoindent                  " automatically set the indent of a new line
set expandtab                   " expand <Tab> to spaces in Insert mode
set shiftround                  " round to 'shiftwidth' for "<<" and ">>"
set shiftwidth=4                " number of spaces used for each step of (auto)indent
set smartindent                 " do clever autoindenting
set smarttab                    " a <Tab> in an indent inserts 'shiftwidth' spaces
set softtabstop=4               " if non-zero, number of spaces to insert for a <Tab>
set tabstop=4                   " number of spaces a <Tab> in the text stands for
" --- END --- Tabs and indenting }}}

" 13) Folding {{{
set foldclose=all               " set to "all" to close a fold when the cursor leaves it
set foldenable                  " set to display all folds open
set foldlevel=0                 " folds with a level higher than this number will be closed
set foldmethod=marker           " folding type: "manual", "indent", "expr", "marker", or "syntax"
" --- END --- Folding }}}

" 14) Mapping {{{
" Permenantlyy disable "ex" mode
nnoremap Q <nop>

" Manually delete all trailing whitespace
nnoremap <silent> <Leader>rtw :call TrimWhiteSpace()<CR>

" Turn off highlight searching until next search is made.
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

let mapleader=","
let g:mapleader=","
" --- END --- Mapping }}}

" 15) Reading and writing files {{{
set backup                      " keep a backup after overwriting a file
set backupdir=~/vimfiles/backup " list of directories to backup files in
set backupext=.bak              " file name extension for the backup file
set fileformats=dos,unix        " list of file formats to look for when editing a file
set modeline                    " enable using settings from modelines when reading a file
set modelines=1                 " number of lines to check for modelines
set writebackup                 " write a backup file before overwriting a file
" --- END --- Reading and writing files }}}

" 16) The swap file {{{
set directory=~/vimfiles/temp   " list of directories for the swap file
" --- END --- The swap file }}}

" 17) Command line editing {{{
set history=9999                " how many command lines are remembered
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png,*~ " list of patterns to ignore files for file name completion
set wildignorecase              " ignore case when completing file names
set wildmenu                    " command-line completion show a list of matches
set wildmode=list:longest       " specifies how command line completion works
" --- END --- Command line editing }}}

" 18) Multi-byte characters {{{
set encoding=utf-8              " character encoding used in Vim
" --- END --- Multi-byte characters }}}

" 19) Various {{{
set viminfo+=!                  " Store upper-case registers in viminfo
" --- END --- Various }}}

" 20) Functions {{{
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
" --- END --- Functions }}}

" 21) Auto commands {{{
autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
" --- END --- Auto commands }}}
