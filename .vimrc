set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" File finder
Plugin 'ctrlpvim/ctrlp.vim'
" Solarized color
Plugin 'altercation/vim-colors-solarized.git'
" Nicer statusbar
Plugin 'bling/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
" + Nicer statusbar for tmux
Plugin 'edkolev/tmuxline.vim'
" Git implementation
Plugin 'tpope/vim-fugitive.git'
" Git implementation 2
Plugin 'airblade/vim-gitgutter.git'
" File browser
Plugin 'scrooloose/nerdtree'
" Fix for nerdtree tab open
"Plugin 'Nopik/vim-nerdtree-direnter'
" Use tab
Plugin 'Lokaltog/vim-easymotion'
" Syntax checker
Plugin 'scrooloose/syntastic'
" Autocomplete
Plugin 'Valloric/YouCompleteMe'
" JS autocomplete 
Plugin 'ternjs/tern_for_vim'
" JS Syntax
Plugin 'pangloss/vim-javascript'
" Buffer (opened files) explorer
"Plugin 'techlivezheng/vim-plugin-minibufexpl'
" Markdown syntax
Plugin 'tpope/vim-markdown'
" Auto adjust vim spaces/tab indent based on current file
Plugin 'ciaranm/detectindent'
" Auto line up text
Plugin 'godlygeek/tabular'
" CSS syntax
Plugin 'hail2u/vim-css3-syntax'
" Tabs in terminal Vim
Plugin 'mkitt/tabline.vim'
" Snippets
Plugin 'SirVer/ultisnips'
" Lots of language support
Plugin 'sheerun/vim-polyglot'
" Integrate shell commands to vim
Plugin 'tpope/vim-eunuch'
" Auto stuff
Plugin 'mattn/emmet-vim'
" Easy surround words with anything
Plugin 'tpope/vim-surround'
" Indent lines
Plugin 'nathanaelkane/vim-indent-guides'
set backspace=indent,eol,start  " backspace

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let mapleader=","
let maplocalleader = "," 
set nomodeline	"Modelines are lines in file, that change default vim behaviour
set ttyfast		"Fast terminal
set noerrorbells
set novisualbell
set notimeout
set nottimeout	"Don't timeout when typing commands
set completeopt=longest,menuone,preview " Better Completion 
set relativenumber	"Show relative line numbers to current line
set ignorecase
set smartcase	"all lowercase = case insensitive, otherwise = case sensitive
set incsearch	" Search options
set showmatch
set hlsearch
set wrap
set colorcolumn=100	" Vertical line seen right of text
set wildmenu    "Better menu
syntax enable
filetype plugin indent on 

" Solarized colors
colorscheme solarized
set background=dark
let s:terminal_italic=1

" UI look
set guifont=Source\ Code\ Pro\ Medium\ 11
" Disable beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0 
let g:syntastic_check_on_wq = 0 

" Status bar 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1 
let g:miniBufExplMaxSize = 20
set laststatus=2
let g:airline_theme='murmur'
let g:airline_powerline_fonts = 1

" Indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set numberwidth=1
set ai "Auto indent
set si "Smart indent

" Pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
if has("gui_running") 
	map <C-S-v> c<ESC>"+gP
	map <C-S-c> c<ESC>"+y
	imap <C-v> <C-r><C-o>+
endif
set pastetoggle=	"Turn on paste

" Shortcuts
map <C-o> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'
map <C-PAGEUP> :MBEbn<CR>
map <C-PAGEDOWN> :MBEbp<CR>
nmap <Leader>br :TagbarToggle<CR>
map <2-LeftMouse>za	" Toggle fold
" nnoremap j gj	" Move straight up/down
" nnoremap k gk
nnoremap <Leader><tab> %	" Jump to other parentheses
vnoremap <Leader><tab> %
nnoremap <leader><esc> :noh<cr>
" Disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Swap & backup files
set backup
set backupdir=~/.vim/backup//
set nowb
set noswapfile

" Completions for files
autocmd FileType less,css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#CompleteTags
autocmd BufNewFile,BufRead \*.{md,mdwn,mkd,mkdn,mark\*} set filetype=markdown
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

set wildmenu
set wildmode=longest:full,full
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
let g:session_autosave = 'no'

" Mouse
set mouse=a

" Remember info about open buffers on close
augroup line_return
	au!
	au BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\ execute 'normal! g`"zvzz' |
				\ endif
augroup END 

 " Ignore files
set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl " compiled spelling word lists
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX bullshit
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.pyc " Python byte code
set wildignore+=*.orig " Merge resolution files 

" YCM
let g:ycm_extra_conf_globlist = ['./*'] " Look for conf file in the same folder
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

" Ultisnips
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"
let g:UltiSnipsListSnippets        = "<c-k>" "List possible snippets based on current file

