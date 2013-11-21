" Copy or symlink to ~/.vimrc

set shell=/bin/sh

set t_Co=256                               " Enable colors (must be set before syntax enable)
set background=dark
colorscheme base16-tomorrow

set nocompatible                           " Must come first because it changes other options.

filetype off

call pathogen#runtime_append_all_bundles()

syntax enable                              " Turn on syntax highlighting.

filetype plugin indent on                  " Turn on file type detection.

runtime macros/matchit.vim                 " Load the matchit plug-in.

set showcmd                                " Display incomplete commands.
set showmode                               " Display the mode you're in.

set backspace=indent,eol,start             " Intuitive backspacing.

set hidden                                 " Handle multiple buffers better.

set wildmenu                               " Enhanced command line completion.
set wildmode=list:longest                  " Complete files like a shell.

set ignorecase                             " Case-insensitive searching.
set smartcase                              " But case-sensitive if expression contains a capital letter.

set number                                 " Show line numbers.
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
set cmdheight=2

set grepprg=ack

" Automatic fold settings for specific files. Uncomment to use.
autocmd BufNewFile,BufRead *.rabl set filetype=ruby
autocmd BufNewFile,BufRead *.js.erb set filetype=javascript
autocmd BufNewFile,BufRead *.hbs set filetype=html

autocmd FileType css,html,javascript,markdown,eruby setlocal shiftwidth=4 tabstop=4 softtabstop=4

autocmd FileType * set list

" Strip trailing white spaces
autocmd BufWritePre * call StripTrailingWhiteSpaces()

" Autosave
" set updatetime=3000
" autocmd BufLeave * update
" autocmd CursorHold * update
" autocmd InsertLeave * update

" Leader Key Mappings

" Change leader key from \ to ,

let mapleader = ","

" File navigation

nnoremap <silent> <leader>a :b#<cr>
nnoremap <silent> <leader>f :CtrlP<cr>
nnoremap <silent> <leader>r :CtrlPClearAllCaches<cr>
nnoremap <silent> <leader>, :CtrlPBuffer<cr>
nnoremap <silent> <leader>e :Explore<cr>
nnoremap <silent> <leader>t :NERDTreeToggle<cr>
nnoremap <silent> <leader>T :NERDTreeFind<cr>

" Ack Mappings

nmap <leader>a :tab split<CR>:Ack ""<left>
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" Goto definition

nnoremap gd <C-]>
nnoremap gD g<C-]>

" Update tags (include Gems)
map <silent> <leader>ct :!ctags -R . `rvm gemdir \| tail -n 1`<cr>

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
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  nmap <leader>a, :Tabularize /,<CR>
  vmap <leader>a, :Tabularize /,\zs<CR>
endif

" Crazy? CTRL-C does not trigger InsertLeave

imap <C-c> <esc>

" CoffeeScript

let coffee_compile_vert=1
map <leader>c :CoffeeCompile<CR>

" CrtlP

let g:ctrlp_working_path_mode = 2
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_match_window_reversed = 0

" Tabs

nnoremap <C-t>n :tabnew<CR>
nnoremap <C-t>h :tabprevious<CR>
nnoremap <C-t>l :tabnext<CR>
nnoremap <C-t><C-t> :tabnext<CR>
nnoremap <C-t>c :tabclose<CR>

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
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? fnamemodify(bufname, ':t') : '[No Name] ')

    if bufmodified
      let s .= ' [+]'
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction

set tabline=%!Tabline()

" UltSnips

let g:UltiSnipsSnippetDirectories=["snippets"]
let g:UltiSnipsSnippetsDir="~/.dotfiles/vim/snippets"

" UltiSnip + YCM Integration
function! g:UltiSnips_Complete()
    call UltiSnips_ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips_JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" NERDTree
let NERDTreeShowHidden=1


