" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Preference for editor screen
syntax on  " highlight syntax

color hybrid
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




"---------------------------------------------------------------------------
" Key assignment
nnoremap <C-o> o<Esc>



"---------------------------------------------------------------------------
" コマンドエイリアス
command Nt tabnew


"---------------------------------------------------------------------------
" Github and vundle
set nocompatible
filetype off

set rtp+=~/dotfiles/vimfiles/vundle.git/        "#vundleのディレクトリ
call vundle#rc()
filetype plugin indent on     " required!


