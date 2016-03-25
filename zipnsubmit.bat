@echo off
7z a temp.zip @haxelibcontent.txt
haxelib submit temp.zip
pause