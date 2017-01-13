@echo off
echo [INFO] Create Menu Files.

cd %~dp0
cd ..
set I18N_LOCALE=zh_CN
call xtab -menu

pause