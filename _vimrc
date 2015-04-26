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
" Neobundle用設定
set nocompatible
filetype off            " for NeoBundle
 
if has('vim_starting')
        set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()
 
" ここから NeoBundle でプラグインを設定します
 
" NeoBundle で管理するプラグインを追加します。
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
filetype plugin indent on       " restore filetype


"---------------------------------------------------------------------------
" Key assignment
nnoremap <C-o> o<Esc>

nnoremap ,tr :NERDTree<CR>
nnoremap ,vim :vsplit<cr><C-w>l:e! ~/.vimrc<cr> " vimrcを開く
nnoremap ,vr :source ~/.vimrc<cr>
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
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


