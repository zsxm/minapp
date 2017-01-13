@echo off
echo [INFO] Create Entity Files.

cd %~dp0
cd ..
set I18N_LOCALE=zh_CN
call xtab -entity

pause