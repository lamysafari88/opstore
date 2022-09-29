@echo off
Setlocal enabledelayedexpansion
::CODER BY Administrator POWERD BY iBAT 1.6
::设置svn默认安装位置以及需要调用的应用程序
set workPath=C:\Program Files\TortoiseSVN\bin
set exeName=TortoiseProc.exe
echo Svn程序路径 C:\Program Files\TortoiseSVN\bin
::需要用户判断自己当前电脑svn的客户端是否也在这个目录下边，如果没有，使用用户录入的目录
set /p input=Svn程序路径是否正确 (Y or N):
if /i "%input%"=="Y" goto Y
if /i "%input%"=="N" goto N
:N
::用户录入正确的目录后，跳转到处理过程
set /p workPath=Svn安装目录=
goto Y
:Y
echo 数据处理中
::使用for循环从 dir 获取到字符串中获取文件夹名字
:: dir /ad-s/b 表示只取目录，并且不是系统文件夹，使用空格模式显示
for /f "delims=" %%i in ('"dir /ad-s/b "') do (
echo 正在查询文件【%%i】是否包含svn信息
::判断是否是svn文件夹
if exist "%~dp0%%i\.svn\" (
echo 正在更新项目 %%i
::调用更新命令
"%workPath%\%exeName%" /command:update /path:%%i /notempfile /closeonend:1)
)
echo 更新完成
pause