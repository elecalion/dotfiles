" Notes {
"   vim: set foldmarker={,} foldmethod=marker foldlevel=0 nospell:
"   vim conf for win32
"   @author: elias wang
"   @date: 2013-07-01
"   @updated: 2017-02-01
" }

" OS {
    " win32 means Win32 version of Vim (MS-Windows 95 and later, 32 or 64 bits)
    let s:is_win32 = has('win32')
    let s:is_win32unix = has('win32unix') " TODO must use cygwin git
    let s:vim_file_path = s:is_win32 ? '~/vimfiles' : '~/.vim'
"}

" Package Manager {
    if !filereadable(expand(s:vim_file_path . '/autoload/plug.vim'))
        let s:cmd_cp = s:is_win32 ? '!copy ' : '!cp '
        let s:cmd_plug = 
                    \'!git clone --depth=1 https://github.com/junegunn/vim-plug.git '
                    \ . expand(s:vim_file_path . '/autoload/vim-plug')
        silent execute s:cmd_plug
        silent execute s:cmd_cp
                    \ . expand(s:vim_file_path . '/autoload/vim-plug/plug.vim ')
                    \ . expand(s:vim_file_path . '/autoload')
    endif

    call plug#begin('~/.vim/plugged')

    " Make sure you use single quotes
    " Interface
    Plug 'mhinz/vim-startify'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Shougo/unite.vim'
    "Plug 'Shougo/denite.nvim'
    Plug 'Shougo/vimfiler.vim'
    "Plug 'ctrlpvim/ctrlp.vim'
    Plug 'milkypostman/vim-togglelist'
    Plug 'MattesGroeger/vim-bookmarks'
    Plug 'mbbill/undotree'
    "Plug 'sjl/gundo.vim'

    " Intergrations
    Plug 'tpope/vim-fugitive'
    Plug 'ludovicchabant/vim-lawrencium'
    "Plug 'mhinz/vim-signify'
    Plug 'scrooloose/syntastic'
    Plug 'mileszs/ack.vim'
    "Plug 'mhinz/vim-grepper'
    "Plug 'dkprice/vim-easygrep'
    "Plug 'Shougo/vimshell.vim'

    " Indexer
    Plug 'majutsushi/tagbar'
    Plug 'ludovicchabant/vim-gutentags'
    "Plug 'elecalion/vim-gutentags'
    "Plug 'jsfaint/gen_tags.vim'
    "Plug 'basilgor/vim-autotags'

    " Completion and template
    Plug 'ervandew/supertab'
    "Plug 'Shougo/neocomplete.vim'
    "Plug 'Rip-Rip/clang_complete'
    Plug 'davidhalter/jedi-vim'
    Plug 'vim-scripts/OmniCppComplete'
    "Plug 'maralla/completor.vim'
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'mptre/vim-printf'

    " Edit
    Plug 'terryma/vim-expand-region'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'godlygeek/tabular'
    Plug 'Dimercel/todo-vim'
    Plug 'justinmk/vim-sneak'
    Plug 'mbbill/fencview'
    Plug 'tpope/vim-commentary'
    "Plug 'raimondi/delimitmate'
    "Plug 'Townk/vim-autoclose'
    Plug 'Yggdroot/indentLine'
    Plug 'kopischke/vim-fetch'

    " Syntax
    Plug 'NLKNguyen/c-syntax.vim'
    Plug 'rust-lang/rust.vim'

    " Color
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'junegunn/seoul256.vim'
    Plug 'chriskempson/base16-vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'chriskempson/vim-tomorrow-theme'
    Plug 'jonathanfilip/vim-lucius'

    " Group dependencies

    " On-demand loading

    " Plugin options
    Plug 'Shougo/vimproc.vim', { 'do': 'tools\\update-dll-mingw' }
    "Plug 'Valloric/YouCompleteMe', { 'do': 'install.py --clang-completer' }

    " Unmanaged plugin (manually installed and updated)
    Plug '~\vimfiles\plugin'

    " Add plugins to &runtimepath
    call plug#end()
"}

" Basics {
    let $LANG='en_US'
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set cpoptions=aABceFsmI
    "             ||||||||+-- Don't delete indent for auto indent
    "             |||||||+-- A showmatch will always wait 0.5s
    "             ||||||+-- Set buffer options when entering the buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> when using :@r
    "             |||+-- Searching continues at the end of the match
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    set noerrorbells " don't make noise
" }

" Text Syntax & Completion{
    syntax on " syntax highlighting on
    filetype plugin on " load filetype plugins settings
    filetype indent on " load filetype indent settings
    set incsearch
    set hlsearch
    set tags=.\tags,tags; " search tags in current and parent paths
    set iskeyword=a-z,A-Z,48-57,_ " included in identifiers
    set completeopt=menuone " always use pop up menu for completions
    set complete=.,w,b,u,t,i " tag completion
    set omnifunc=syntaxcomplete#Complete
    set wildmenu " turn on command line completion wild style
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc " ignore these list file extensions
    "set wildmode=list:longest " turn on wild mode huge list
" }

" Text Formatting & Layout {
    set expandtab " no real tabs please!
    set smarttab " it's smart
    set formatoptions=rq " Automatically insert comment leader on return,
                          " and let gq format comments
"   set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set smartcase " if there are caps, go case-sensitive
    set nowrap " do not wrap line
    set breakindent " wrapped line will continue visually indented
    set linebreak " break at speciel character
    set showbreak=>\
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set shiftwidth=4 " auto-indent amount when using cindent
    set softtabstop=4 " space nums when hitting tab or backspace
    set tabstop=4 " real tabs
    set backspace=indent,eol,start " bs functions in Insert mode
    set diffopt+=iwhite " ignore white spaces while using vimdiff
" }

" Buffer & Files {
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
"    set autochdir " always switch to the current file directory
    set backupdir=.,~/temp " where to put backup files
"    set backup " make backup files
"    set directory=~/swap//,. " directory to place swap files in
    set clipboard+=unnamed " share windows clipboard
" }

" Language {
    set enc=utf-8 " vim inner encoding
    set fencs=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,default,latin1
" }

" Vim UI {
    set cursorcolumn " highlight the current column
    set cursorline " highlight current line
    set incsearch " BUT do highlight as you type you
                   " search phrase
    set laststatus=2 " always show the status line
    set cmdheight=1 " cmd field height
    set lazyredraw " do not redraw while running macros
    set matchtime=5 " how many tenths of a second to blink
                     " matching brackets for
"    set nohlsearch " do not highlight searched for phrases
"    set nostartofline " leave my cursor where it was
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=5 " keep 5 lines (top/bottom) for scope
    set sidescrolloff=10 " Keep 10 lines at the size
    set sidescroll=3 " Scroll 3 column at the side
    set shortmess=aOstT " shortens messages to avoid
                         " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    "set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
    set mouse=a " use mouse everywhere
" }

" GUI Settings {
if has("gui_running")
    set columns=160 " column size
    set lines=46 " line size
    set rop=type:directx " text renderer and set its options
    if s:is_win32
        set guifont=DejaVu_Sans_Mono:h11:cANSI " global font
        "set gfw=YouYuan:h8:cGB2312 " wide font only for UTF-8
    else
        set guifont=DejaVu\ Sans\ Mono\ 11
    endif
    set guioptions=acgmrh
    "              || ||
    "              || |+r -- right scroll bar
    "              || +m -- menu bar
    "              |+c -- use simple dialogs rather than pop-ups
    "              +a -- autoselect highlighted text into "*
    "              -e -- non-GUI tabline
    set mousehide " hide the mouse cursor when typing
    set guitablabel=%m%t%R%H
    winpos 160 100
endif
" }

" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default
                        " if you use a high foldlevel)
    set foldmethod=syntax " Fold on the marker
    set foldlevel=100 " Don't autofold anything (but I can still
                      " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                      " open folds
" }

" Plugin Settings {
    " External {
        set grepprg=ag\ --vimgrep\ 
        set grepformat=%f:%l:%C:%m
        set csprg=gtags-cscope
        set cscopequickfix=s0,d-,i-,t-,e-
    "}
    " Grep {
        "let g:EasyGrepWindowPosition="belowright"
        "let g:EasyGrepSearchCurrentBufferDir=0
        "let g:EasyGrepJumpToMatch=0
        "let g:EasyGrepRecursive=1
        "let g:EasyGrepMode=2
        "let g:EasyGrepInvertWholeWord=0
        "let g:EasyGrepCommand=1
        if executable('ag')
            let g:ackprg = 'ag --vimgrep'
        endif

    " }
    " SuperTab Settins {
        let g:SuperTabDefaultCompletionType="context"
    " }
    " Syntastic {
        "let g:syntastic_c_checkers=['cppcheck', 'splint']
        let g:syntastic_c_checkers=['cppcheck']
        let g:syntastic_c_cppcheck_args="--suppress=variableScope"
        let g:syntastic_python_checkers=['python']
    " }
    " Pydiction {
        let g:pydiction_location = '~\vimfiles\complete-dict'
    " }
    " Airline {
        let g:airline_theme='tomorrow'
        let g:airline#extensions#tagbar#enabled = 0
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#tab_nr_type = 1
        let g:airline#extensions#tabline#show_splits = 0
    " }
    " Tagbar Settins {
        let g:tagbar_width = 32
        let g:tagbar_autofocus = 1
    " }
    " Toggle list Settings {
        let g:toggle_list_no_mappings = 1
    " }
    " Undo Tree {
        if has("persistent_undo")
            set undodir='~/.undodir/'
            set undofile
        endif
    " }
    " Tags {
        "let g:gen_ctags_opts='--c++-kinds=+p --fields=+iaS --extra=+q'
        "let g:gen_ctags_path_delimiters = '_'
        let g:gutentags_modules = ['ctags', 'gtags_cscope']
        let g:gutentags_add_default_project_roots = 0
        let g:gutentags_project_root = ['.git', '.hg', '.bzr', '_tags', '.tags']
        if s:is_win32unix " git bash for windows may slow down in / path
            let g:gutentags_project_root_depth = 1
        else
            let g:gutentags_project_root_depth = 9
        endif
    " }
    " Expand Region {
        let g:expand_region_text_objects = {
                \ 'iw'  :0,
                \ 'iW'  :0,
                \ 'i"'  :0,
                \ 'i''' :0,
                \ 'i]'  :1,
                \ 'ib'  :1,
                \ 'iB'  :1,
                \ 'il'  :0,
                \ 'ip'  :0,
                \ 'ie'  :0,
                \ }
    " }
    " Unite / denite {
        if executable('ag')
            let g:unite_source_rec_async_command = [ 'ag', '--nocolor', '--nogroup',
                        \  '-g', '' ]
            "call denite#custom#var('file_rec', 'command',
            "            \ [ 'ag', '--nocolor', '--nogroup', '-g', '' ])
        endif
    " }
    " CtrlP {
        "if executable('ag')
        "    let g:ctrlp_user_command = {
        "                \ 'types': {
        "                \ 1: ['.git', 'cd %s && git ls-files'],
        "                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        "                \ },
        "                \ 'fallback': 'ag -l -g "" --nocolor %s'
        "                \ }
        "endif
    " }
    " Startify {
        "let g:startify_list_order = ['bookmarks', 'sessions', 'files', 'dir', 
        "    \ 'commands']
    " }
    " Doxygen {
        let g:load_doxygen_syntax=0 " load doxygen syntax
    " }
" }

" Mappings {
    " fun
    map <F12> ggVGg?
    "map <F3> :GenGTAGS<CR>
    "map <F4> :GenCtags<CR>
    nnoremap <C-]> g<C-]>
    function! SwitchNextView()
        return tabpagenr("$")==1 ? ":bn\<CR>" : ":tabn\<CR>"
    endfunction
    function! SwitchPreviousView()
        return tabpagenr("$")==1 ? ":bp\<CR>" : ":tabp\<CR>"
    endfunction
    nnoremap <expr> <C-j> SwitchPreviousView()
    nnoremap <expr> <C-k> SwitchNextView()
    nnoremap <C-h> :bp<CR>
    nnoremap <C-l> :bn<CR>
    " delete to black hole
    nnoremap <C-d> "_
    " paste from yank register
    nnoremap <C-p> "0p
    nmap <Leader>cd :cd %:p:h<CR>:pwd<CR>
    nmap <Leader>ghi :echo synIDattr(synID(line('.'),col('.'),1),'name')<CR>
    nmap <script> <silent> <leader>tl :call ToggleLocationList()<CR>
    nmap <script> <silent> <leader>tq :call ToggleQuickfixList()<CR>
    nmap <Leader>tt :TagbarToggle<CR>
    nmap <Leader>tr :TagbarShowTag<CR>
    nmap <Leader>tf :VimFilerExplorer<CR>
    nmap <Leader>tu :UndotreeToggle<CR>:UndotreeFocus<CR>
    nmap <Leader>td :TODOToggle<CR>
    nmap <Leader>ll :Errors<CR>
    nmap <leader>aa  :Ack<cr>
    " unite / denite {
        nmap <C-u> [unite]
        nnoremap [unite]m :<C-u>Unite bookmark<CR>
        nnoremap [unite]b :<C-u>Unite -start-insert buffer<CR>
        nnoremap [unite]f :<C-u>Unite -start-insert file_rec<CR>
        nnoremap [unite]g :<C-u>Unite -start-insert file_rec/git<CR>
        nnoremap [unite]o :<C-u>Unite outline<CR>
        nnoremap <leader>f :<C-u>Unite -start-insert file_rec<CR>
        nnoremap <leader>g :<C-u>Unite -start-insert file_rec/git<CR>
    "}
    " grepper {
       "nnoremap <leader>git :Grepper -tool git<cr>
       "nnoremap <leader>ag  :Grepper -tool ag  -cword -noprompt -highlight<cr>
       "nnoremap <leader>ack :Grepper -tool ack -cword -noprompt -highlight<cr>
    "}
    " easy align {
        nmap <Leader>al <Plug>(EasyAlign)
        vmap <Enter> <Plug>(EasyAlign)
    "}
    " cscope mapping {
        " To do the first type of search, hit 'CTRL-\', followed by one of the
        " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
        " search will be displayed in the current window.  You can use CTRL-T to
        " go back to where you were before the search.  
        "
        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
        nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	
    "}
" }

" Colors {
    set background=light
    "g:solarized_termcolors=   16      |   256
    "g:solarized_termtrans =   0       |   1
    "g:solarized_degrade   =   0       |   1
    "g:solarized_bold      =   1       |   0
    "g:solarized_underline =   1       |   0
    "g:solarized_italic    =   1       |   0
    "g:solarized_contrast  =   "normal"|   "high" or "low"
    "g:solarized_visibility=   "normal"|   "high" or "low"
    let g:solarized_underline = 0
    if has("gui_running")
        colorscheme solarized
    else
        colorscheme Tomorrow
    endif
" }

" etc. {
    function! ToggleVerbose()
        if !&verbose
            set verbosefile=~\vimfiles\log\verbose.log
            set verbose=20
        else
            set verbose=0
            set verbosefile=
        endif
    endfunction
" }
