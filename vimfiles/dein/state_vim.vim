if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/c/Users/takmor.SYNCRON/.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim81,/usr/share/vim/vimfiles/after,/c/Users/takmor.SYNCRON/.vim/after,/c/Users/takmor.SYNCRON/.vim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/c/Users/takmor.SYNCRON/.vimrc', '/c/Users/takmor.SYNCRON/.vim/dein/dein.toml', '/c/Users/takmor.SYNCRON/.vim/dein/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/c/Users/takmor.SYNCRON/.vim/dein'
let g:dein#_runtime_path = '/c/Users/takmor.SYNCRON/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/c/Users/takmor.SYNCRON/.vim/dein/.cache/.vimrc'
let &runtimepath = '/c/Users/takmor.SYNCRON/.vim,/usr/share/vim/vimfiles,/c/Users/takmor.SYNCRON/.vim/dein/repos/github.com/Shougo/dein.vim,/c/Users/takmor.SYNCRON/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vim81,/c/Users/takmor.SYNCRON/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/c/Users/takmor.SYNCRON/.vim/after'
filetype off
  set background=dark
  au MyAutoCmd VimEnter * nested colorscheme industry
