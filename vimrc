" Copy or symlink to ~/.vimrc

set shell=/bin/sh

set t_Co=256                      " Enable colors (must be set before syntax enable)
set background=dark
color lucius

set nocompatible                  " Must come first because it changes other options.

filetype off

call pathogen#runtime_append_all_bundles() " load pathogen

syntax enable                     " Turn on syntax highlighting.

filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plug-in.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set nowrap                        " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set softtabstop=2                 " set backspace to return the same number of spaces with indentation
set expandtab                     " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
set cmdheight=2

set grepprg=ack

" Make insert mode move obvious
au InsertEnter * hi StatusLine term=NONE ctermbg=DarkRed ctermfg=Black
au InsertLeave * hi StatusLine term=NONE ctermbg=Gray ctermfg=Black

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{rvm#statusline()}\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Automatic fold settings for specific files. Uncomment to use.
autocmd BufNewFile,BufRead *.rabl set filetype=ruby
autocmd BufNewFile,BufRead *.js.erb set filetype=javascript
autocmd BufNewFile,BufRead *.hamljs set filetype=haml

autocmd FileType css,html,javascript,markdown,eruby setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType * set list

" Strip trailing white spaces
autocmd BufWritePre *.md,*.js,*.rb,*.html,*.erb,*.css,*.sass,*.coffee call StripTrailingWhiteSpaces()

" Leader Key Mappings

" Change leader key from \ to ,
let mapleader = ","

" File navigation
nnoremap <silent> <leader>a :b#<cr>
nnoremap <silent> <leader>f :CommandTFlush<cr>\|:CommandT<cr>
nnoremap <silent> <leader>, :CommandTBuffer<cr>
nnoremap <silent> <leader>. :Explore<cr>
nnoremap <silent> <leader>t :NERDTreeToggle<cr>
nnoremap <silent> <leader>T :NERDTreeFind<cr>

nnoremap <leader>gv :topleft 100 :vsplit $MYVIMRC<cr>

" Rails specific mappings
nnoremap <leader>gg :topleft 100 :vsplit Gemfile<cr>
nnoremap <leader>ga :topleft 100 :vsplit config/application.rb<cr>
nnoremap <leader>ge :topleft 100 :vsplit config/environment.rb<cr>
nnoremap <leader>gr :topleft 100 :vsplit config/routes.rb<cr>

nnoremap <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
nnoremap <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
nnoremap <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
nnoremap <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
nnoremap <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
nnoremap <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
nnoremap <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets/sass<cr>
nnoremap <leader>gj :CommandTFlush<cr>\|:CommandT public/javascripts<cr>

" Write routes in buffer
nnoremap <leader>gR :call ShowRoutes()<cr>

" Goto definition
nnoremap gd <c-]>
nnoremap gD g<c-]>

" Update tags (include Gems)
map <silent> <leader>ct :!ctags -R * `rvm gemdir \| tail -n 1`/*<cr>

" Navigate by screen line (instead of text line)
nnoremap j gj
nnoremap k gk

" Easy access to the start and the end of the line
nnoremap - ^
nnoremap _ $

" Append matching 
inoremap (( ()<Left>
inoremap [[ []<Left>
inoremap {{ {}<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap \|\| \|\|<Left>

" Turnoff search highlighting by pressing enter key
nnoremap <LEADER>m :nohlsearch<cr>/<BS>

" Save file as sudo
nnoremap :W !sudo tee % >/dev/null

" Annoyances
" nmap :Q :q
" nmap :X :x
" nmap :qç :q
" nmap :xç :x
" nmap :wç :w

" Visual Mode Mappings

" Keep selection after indent a visual block
vnoremap > >gv
vnoremap < <gv

" Tag List plug-in configuration
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

" ctags file location
set tags=./tags;

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Bubbling text
nmap <C-up> [e
nmap <C-k> [e
nmap <C-down> ]e
nmap <C-j> ]e

vmap <C-up> [egv
vmap <C-k> [egv
vmap <C-down> ]egv
vmap <C-j> ]egv

" Make the current window big, but leave others context
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=10
set winminheight=10
set winheight=999

" Vim Notes plug-in configuration
let g:notesRoot = '~/Documents/Notes'
let g:notesFileExtension = '.md'
let g:notesFileType = 'markdown'
let g:notesWordSeparator = '_'

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

" Tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a, :Tabularize /,<CR>
  vmap <Leader>a, :Tabularize /,\zs<CR>
endif

" Tabularize tables (pipes) as they are being typed
function! <SID>align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
noremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

vmap <leader>! :call ExecuteSelectedLines()<cr>

" Sort range line numbers (for ExecuteSelectedLines)
function! NumSort(a, b)
  return a:a>a:b ? 1 : a:a==a:b ? 0 : -1
endfunction

function! ExecuteSelectedLines()
  let [firstline, lastline]=sort([line('v'), line('.')], 'NumSort')
  let lines = getline(firstline, lastline)
  exec ":!".join(lines, " && ")
endfunction

" Inserts routes in a new buffer
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction

" " Auto complete using tab
" function! TabComplete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction
" inoremap <Tab> <C-R>=TabComplete()<CR>

" Fast swithing of the background
function! SwitchBackground()
  let &background = (&background == "dark" ? "light" : "dark")
endfunction
" noremap <leader>l :call SwitchBackground()<CR>

" Crazy? CTRL-C does not trigger InsertLeave
imap <c-c> <esc>

" CoffeeScript
let coffee_compile_vert=1
map <leader>c :CoffeeCompile<CR>
