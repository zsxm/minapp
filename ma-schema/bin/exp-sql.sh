#!/bin/sh

echo [INFO] Create DDL SQL Files.

cd ..
export I18N_LOCALE=zh_CN
xtab -sql
