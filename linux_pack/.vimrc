" Configuration file for vim
" test
set modelines=0		" CVE-2007-2438
" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
" Preference for editor screen
syntax on  " highlight syntax
"color hybrid
"colorscheme hybrid
" スワップファイルなどの出力先
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
set undodir=~/.vim/undo/
"---------------------------------------------------------------------------
" Invisible Characters
set list
set listchars=tab:>-,eol:$
"---------------------------------------------------------------------------
" その他、見栄えに関する設定:
"
" 検索文字列をハイライトしない(_vimrcではなく_gvimrcで設定する必要がある)
"set nohlsearch
set showtabline=2 " タブ化
" 行番号を表示
set number
" 現在の行をハイライト
set cursorline
"---------------------------------------------------------------------------
" タブを表示するときの幅
set tabstop=4
" タブを挿入するときの幅
set shiftwidth=4
" タブをタブとして扱う(スペースに展開しない)
set noexpandtab
" 
set softtabstop=0
" 自動改行しない
set textwidth=0
" textwidthでフォーマットさせたくない
set formatoptions=q
" :vimgrepで自動にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow
"---------------------------------------------------------------------------
" Key assignment
nnoremap ; :
nnoremap ,xml :%s/></>\r</g<CR>ggVG=<CR>"Reform XML
" nnoremap ,xml :%s/></>\r</g<CR>filetype indent on<CR>setf xml<CR>ggVG=<CR>"Reform XML
nnoremap <C-o> o<Esc>
nnoremap ,vim :vsplit<cr><C-w>l:e! ~/.vimrc<cr> " vimrcを開く
nnoremap ,vr :source ~/.vimrc<cr>
" ===Window changes from http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca ===
" Window size changes
nnoremap s <Nop>
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
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
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
" コマンドエイリアス
" command Nt tabnew
"---------------------------------------------------------------------------
" https://sites.google.com/site/fudist/Home/vim-nihongo-ban/-vimrc-sample
""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
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

