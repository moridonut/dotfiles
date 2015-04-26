" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Preference for editor screen
syntax on  " highlight syntax

color hybrid
colorscheme hybrid
"---------------------------------------------------------------------------
" Invisible Characters
set list
set listchars=tab:>-,eol:$

"---------------------------------------------------------------------------
" フォント設定:
"
if has('win32')
  " Windows用
  set guifont=MS_Gothic:h10:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  "if has('kaoriya')
  "  set ambiwidth=auto
  "endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif


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




"---------------------------------------------------------------------------
" Key assignment
nnoremap <C-o> o<Esc>



"---------------------------------------------------------------------------
" コマンドエイリアス
command Nt tabnew


