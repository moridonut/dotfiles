" Configuration file for vim
" test
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Run vim-indent-guides when starting vim
let g:indent_guides_enable_on_vim_startup = 1

" Preference for editor screen
syntax on  " highlight syntax

set t_Co=256

" Swap file directory
:set directory=~/Documents/vimfiles/tmp
:set backupdir=~/Documents/vimfiles/tmp

" Change current directory per the current buffer file.
set autochdir

"---------------------------------------------------------------------------
" Invisible Characters
set list
set listchars=tab:>-,eol:$

"---------------------------------------------------------------------------
" Other appearance settings
"
set hlsearch "Highlight search result
set showtabline=2 " Show tabs
set number "Show line number
set cursorline "Highlight current row
set wildmenu "Snippet when pressing tab on command
set history=500 "Number of history to save

set tabstop=4 "tab width
set shiftwidth=4 "tab width
set noexpandtab "Treat tabs as tabs (i.e. do not replace with spaces)
" 
set softtabstop=0

set textwidth=0 "No auto return
set formatoptions=q
set fileformats=unix,dos,mac

" Status lines
set laststatus=2 "Always show status line
set showmode " Show the current mode
set showcmd " Show the command executed
set ruler " Show ruler on the bottom right


" :vimgrep to show quick fix window automatically
autocmd QuickFixCmdPost *grep* cwindow

" ---------------------------------------------------------
" use dein.vim
if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

let s:dein_dir = $HOME . '/.vim/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml = s:dein_dir . '/dein.toml'
let s:lazy_toml = s:dein_dir . '/dein_lazy.toml'
let &rtp = &rtp .",". s:dein_repo_dir


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()

  if dein#check_install()
    call dein#install()
  endif
endif

silent! execute 'helptags' s:dein_repo_dir . '/doc/'
"---------------------------------------------------------------------------
" originalrepos on github
" NeoBundle 'Shougo/vimproc'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neocomplete.vim' " Further setting is on the buttom
" NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neosnippet'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'scrooloose/syntastic' 
" NeoBundle 'scrooloose/nerdtree' 
" NeoBundle 'tpope/vim-endwise'
" Auto end
" NeoBundle 'tomtom/tcomment_vim'
" Colored indent
" NeoBundle 'nathanaelkane/vim-indent-guides'
" Run vim-indent-guides when starting vim

" Highlight replacing words
" NeoBundle 'osyo-manga/vim-over'

" Hyper status line
" NeoBundle 'itchyny/lightline.vim'

" Colorscheme
" NeoBundle 'tomasr/molokai'


"---------------------------------------------------------------------------
"---------------------------------------------------------------------------
" Key assignment

" .vimrc settings
nnoremap ,vim :vsplit<cr><C-w>l:e! ~/.vimrc<cr> 
nnoremap ,gvim :vsplit<cr><C-w>l:e! ~/.gvimrc<cr> 
nnoremap ,vr :source ~/.vimrc<cr>

"---------------------------------------------------------------------------
" Color and Formatting changes

" Reform XML
nnoremap ,xml :%s/></>\r</g<CR>:filetype indent on<CR>:setf xml<CR>:normal gg=G<CR>
nnoremap ,sql :set filetype=sql<CR>
" Stop highlight search result
" nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap <Esc><Esc> :noh<CR>

"---------------------------------------------------------------------------
nnoremap <C-o> o<Esc>

" Change CRLF to LF
nnoremap <silent> ,lf :e<space>++ff=unix<CR>:%s/<C-v><C-m>//g<CR>

"---------------------------------------------------------------------------
" Plugins
nnoremap ,tr :NERDTree<CR>

nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,ud :<C-u>Unite file<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

" nnoremap <C-e> :!ruby % "Run ruby


" ===Window changes from http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca ===
" Window size changes
" nnoremap s <Nop>

" Active window changes
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" -----
" Window place swap
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
" rotate
nnoremap sr <C-w>r

" -----
" Window size changes
" to the same size
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" Destroy x and s delete register
nnoremap x "_x
xnoremap x "_x
nnoremap s "_s
xnoremap s "_s

" Quickly move in Quickfix
nnoremap q[ :cprevious<CR>
nnoremap q] :cnext<CR>
nnoremap Q[ :<C-u>cfirst<CR>
nnoremap Q] :<C-u>clast<CR>

" Re-yank after visual mode paste
xnoremap <expr> p 'pgv"'.v:register.'y`>'

" Pick word on cursor for replacement
nnoremap sub :OverCommandLine<CR>%s/
nnoremap <expr> c* ':OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>'
vnoremap <expr> c* ':OverCommandLine<CR>s//g<Left><Left>'
" To check later.
" call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
" call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
" call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
" call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
" call submode#map('bufmove', 'n', '', '>', '<C-w>>')
" call submode#map('bufmove', 'n', '', '<', '<C-w><')
" call submode#map('bufmove', 'n', '', '+', '<C-w>+')
" call submode#map('bufmove', 'n', '', '-', '<C-w>-')



"----------------------------------------------------------
" COLOR SCHEME

color hybrid
colorscheme hybrid

