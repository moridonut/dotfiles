" Configuration file for vim
" test
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Preference for editor screen
syntax on  " highlight syntax

color hybrid
colorscheme hybrid

" Swap file directory
:set directory=~/Documents/vimfiles/tmp
:set backupdir=~/Documents/vimfiles/tmp

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
"---------------------------------------------------------------------------

set tabstop=4 "tab width
set shiftwidth=4 "tab width
set noexpandtab "Treat tabs as tabs (i.e. do not replace with spaces)
" 
set softtabstop=0

set textwidth=0 "No auto return
set formatoptions=q

" :vimgrep to show quick fix window automatically
autocmd QuickFixCmdPost *grep* cwindow

"---------------------------------------------------------------------------
" Neobundle settings
filetype off            " for NeoBundle
 
if has('vim_starting')
        set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

 
" ===== Neobundle plugins =====
 
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/unite.vim.git'
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
" NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic' 
NeoBundle 'scrooloose/nerdtree' 
NeoBundle 'tpope/vim-endwise'
" Auto end
NeoBundle 'tomtom/tcomment_vim'
" Colored indent
NeoBundle 'nathanaelkane/vim-indent-guides'

call neobundle#end()

" " Run vim-indent-guides when starting vim
let g:indent_guides_enable_on_vim_startup = 1

filetype plugin indent on       " restore filetype

" Check if any uninstalled NeoBundles
" NeoBundleCheck




"---------------------------------------------------------------------------
" Key assignment

" .vimrc settings
nnoremap ,vim :vsplit<cr><C-w>l:e! ~/.vimrc<cr> " Open VIMRC
nnoremap ,vr :source ~/.vimrc<cr> "Run VIMRC

" Color and Formatting changes
nnoremap ,xml :%s/></>\r</g<CR>:filetype indent on<CR>:setf xml<CR>:normal gg=G<CR>"Reform XML
nnoremap ,sql :set filetype=sql<CR> "Assign SQL format
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return> "Stop search highlighting

nnoremap <C-o> o<Esc>

nnoremap ,tr :NERDTree<CR>

nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

nnoremap <C-e> :!ruby % "Run ruby


" ===Window changes from http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca ===
" Window size changes
" nnoremap s <Nop>

" Active window changes
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" Window place swap
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r  "Rotate

" Window size changes
nnoremap s= <C-w>=	"To the same size
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
nnoremap s "_s

" To check later.
" call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
" call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
" call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
" call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
" call submode#map('bufmove', 'n', '', '>', '<C-w>>')
" call submode#map('bufmove', 'n', '', '<', '<C-w><')
" call submode#map('bufmove', 'n', '', '+', '<C-w>+')
" call submode#map('bufmove', 'n', '', '-', '<C-w>-')



"---------------------------------------------------------------------------
" Github and vundle
set nocompatible
filetype off

set rtp+=~/dotfiles/vimfiles/vundle.git/        "#vundle directory
" call vundle#rc()
filetype plugin indent on     " required!


" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" Change status bar color when insert mode
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

