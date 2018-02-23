::Exclude .git directory from zipping files for linux
mkdir ..\tmp
mkdir ..\tmp\dotfiles
mkdir ..\tmp\dotfiles\indent
mkdir ..\tmp\dotfiles\linux_installation
mkdir ..\tmp\dotfiles\vimfiles

copy _vimrc ..\tmp\dotfiles
copy gvimrc ..\tmp\dotfiles
copy indent ..\tmp\dotfiles\indent
copy linux_installation ..\tmp\dotfiles\linux_installation
xcopy /I /E vimfiles ..\tmp\dotfiles\vimfiles
"C:\Program Files (x86)\Lhaplus\Lhaplus.exe" /o:"..\" /c:zip "..\tmp\dotfiles"
rd /s /q ..\tmp

