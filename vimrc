"
"  /$$$$$$                            /$$              /$$    /$$ /$$
" |_  $$_/                           | $/             | $$   | $$|__/
"   | $$ /$$    /$$ /$$$$$$  /$$$$$$$|_//$$$$$$$      | $$   | $$ /$$ /$$$$$$/$$$$   /$$$$$$   /$$$$$$$
"   | $$|  $$  /$$/|____  $$| $$__  $$ /$$_____/      |  $$ / $$/| $$| $$_  $$_  $$ /$$__  $$ /$$_____/
"   | $$ \  $$/$$/  /$$$$$$$| $$  \ $$|  $$$$$$        \  $$ $$/ | $$| $$ \ $$ \ $$| $$  \__/| $$
"   | $$  \  $$$/  /$$__  $$| $$  | $$ \____  $$        \  $$$/  | $$| $$ | $$ | $$| $$      | $$
"  /$$$$$$ \  $/  |  $$$$$$$| $$  | $$ /$$$$$$$/         \  $/   | $$| $$ | $$ | $$| $$      |  $$$$$$$
" |______/  \_/    \_______/|__/  |__/|_______/           \_/    |__/|__/ |__/ |__/|__/       \_______/
"
" Author: Ivan Torres
" repo: https://github.com/mexpolk/dotfiles
"
" Copy or symlink to ~/.vimrc

set nocompatible " Must come first because it changes other options.
filetype off

" -----------------------------------------------------------------------------
" Setup Python paths
" -----------------------------------------------------------------------------
let g:python2_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

" -----------------------------------------------------------------------------
" Start Vundle configuration
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/bundle')

" === Editing Plugins === "

" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Auto-close plugin
Plug 'rstacruz/vim-closer'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" Auto-completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Surround selection with (), [], {}
Plug 'tpope/vim-surround'

" Emmet
Plug 'mattn/emmet-vim'

" Toggle comments
Plug 'tomtom/tcomment_vim'

" Create scratch buffers
Plug 'duff/vim-scratch'

" Text alignment
Plug 'godlygeek/tabular'

" Use .editorconfig
Plug 'editorconfig/editorconfig-vim'

" === Git Plugins === "

" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" === Javascript Plugins === "

" Typescript syntax highlighting
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" Display actual color in CSS
Plug 'gorodinskiy/vim-coloresque'

" GraphQL Support
Plug 'jparise/vim-graphql'

" Prettier
Plug 'dense-analysis/ale'

" === UI === "

" File explorer
Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'mhartington/oceanic-next'
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Indentation-line
Plug 'Yggdroot/indentLine'

" === Other Uncategorized === "

Plug 'albfan/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'metakirby5/codi.vim'

" === Disabled === "

" Plug 'airblade/vim-gitgutter'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'fatih/vim-go'
" Plug 'mattn/gist-vim'

call plug#end()

" -----------------------------------------------------------------------------
" End Vundle configuration
" -----------------------------------------------------------------------------

set encoding=UTF-8
set shell=/bin/sh

set t_Co=256                               " Enable colors (must be set before syntax enable)
set background=dark

call pathogen#runtime_append_all_bundles()

colorscheme dracula
syntax enable                              " Turn on syntax highlighting.

filetype plugin indent on                  " Turn on file type detection.

runtime macros/matchit.vim                 " Load the matchit plug-in.

set showcmd                                " Display incomplete commands.
set showmode                               " Display the mode you're in.

set mouse=a                                " Enable mouse behavior

set backspace=indent,eol,start             " Intuitive backspacing.

set conceallevel=0                         " Don't hide quotes on JSON

set hidden                                 " Handle multiple buffers better.

set wildmenu                               " Enhanced command line completion.
set wildmode=list:longest                  " Complete files like a shell.

set ignorecase                             " Case-insensitive searching.
set smartcase                              " But case-sensitive if expression contains a capital letter.

set number relativenumber                  " Show line numbers.
set ruler                                  " Show cursor position.

set incsearch                              " Highlight matches as you type.
set hlsearch                               " Highlight matches.

set nowrap                                 " Turn on line wrapping.
set scrolloff=3                            " Show 3 lines of context around the cursor.

set title                                  " Set the terminal's title

set novisualbell
set errorbells

set nobackup                               " Don't make a backup before overwriting a file.
set nowritebackup                          " And again.
set directory=./tmp,/tmp                   " Keep swap files in one location

set tabstop=2                              " Global tab width.
set shiftwidth=2                           " And again, related.
set softtabstop=2                          " set backspace to return the same number of spaces with indentation
set expandtab                              " Use spaces instead of tabs

set laststatus=2                           " Show the status line all the time
set cmdheight=2                            " Command section height
set shell=/usr/local/bin/zsh               " Set shell to ZSH

set clipboard=unnamed                      " yank to default clipboard

autocmd FileType * set list

" === Mappings ===

" Change leader key from \ to ,
let mapleader = ","

" Why do I have to press <s>: to send commands? ; Doesn't do anything anyways!
noremap ; :

" Replace Ctrl+C with ESC in edit-mode
imap <C-c> <esc>

" File navigation
nnoremap <silent> <leader>a :b#<cr>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>, :CtrlPBuffer<cr>
nnoremap <silent> <leader>e :Explore<cr>
nnoremap <silent> <leader>t :NERDTreeToggle<cr>
nnoremap <silent> <leader>T :NERDTreeFind<cr>

" Ack mappings
nmap <leader>s :tab split<CR>:Ack ""<left>
nmap <leader>S :tab split<CR>:Ack <C-r><C-w><CR>

" Goto definition
" nnoremap gd <C-]>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap gD g<C-]>

" Navigate by screen line (instead of text line)
nnoremap j gj
nnoremap k gk

" Easy access to the start and the end of the line
nnoremap - ^
nnoremap _ $

" Append matching
inoremap (( ()<left>
inoremap [[ []<left>
inoremap {{ {}<left>
inoremap "" ""<left>
inoremap '' ''<left>

" Turnoff search highlighting by pressing enter key
nnoremap <leader>m :nohlsearch<CR>/<BS>

" Save file as sudo
nnoremap :W !sudo tee % >/dev/null

" Keep selection after indent a visual block
vnoremap > >gv
vnoremap < <gv

" Bubbling text
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-k> [egv
vmap <C-j> ]egv

" Tabularize code
if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  nmap <leader>a, :Tabularize /,<CR>
  vmap <leader>a, :Tabularize /,\zs<CR>
endif

" Tabs
nnoremap <C-t>n :tabnew<CR>
nnoremap <C-t>h :tabprevious<CR>
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t><C-t> :tabnext<CR>
nnoremap <C-t>c :tabclose<CR>

" === UI ===

" NERDTree
let NERDTreeShowHidden=1

" Airline
let g:airline_powerline_fonts=1
let g:airline_left_sep=' '
let g:airline_right_sep=' '

" Crtl+P
let g:ctrlp_working_path_mode='a'
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_match_window_reversed=0
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git'

" Syntax highlighting
let g:jsx_ext_required=0
let g:vim_json_syntax_conceal=0

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Make the current window big, but leave others context
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999

" Format Tab
function! Tabline()
  let s = ''

  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':['
    let s .= (bufname != '' ? fnamemodify(bufname, ':t') : '<No name>')

    if bufmodified
      let s .= ' +'
    endif

    let s .= ']'
  endfor

  let s .= '%#TabLineFill#'

  return s
endfunction

set tabline=%!Tabline()

" === Editting ===

" autocompletion mappings (insertmode)
imap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Snippets
let g:UltiSnipsSnippetDirectories=["snippets"]
let g:UltiSnipsSnippetsDir="~/.dotfiles/vim/snippets"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsExpandTrigger="<C-tab>"
let g:UltiSnipsListSnippets="<C-S-tab>"

" Indentation
let g:indentLine_conceallevel=0

" .editorconfig
let g:EditorConfig_max_line_indicator = "none"

" Prettier
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_tsserver_autoimport = 1
let g:ale_fix_on_save = 1

" Autosave
" set updatetime=60000
" autocmd BufLeave * update
" autocmd CursorHold * update
" autocmd InsertLeave * update

" Strip trailing white spaces before file is saved
function! StripTrailingWhiteSpaces()
  " Store the current position
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Strip white spaces
  %s/\s\+$//e
  " Restore previous search history and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre * call StripTrailingWhiteSpaces()

