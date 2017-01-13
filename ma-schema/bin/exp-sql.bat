@echo off
echo [INFO] Create DDL SQL Files.

cd %~dp0
cd ..
set I18N_LOCALE=zh_CN
call xtab -sql

pause