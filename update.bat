@echo off
Setlocal enabledelayedexpansion
::CODER BY Administrator POWERD BY iBAT 1.6
::����svnĬ�ϰ�װλ���Լ���Ҫ���õ�Ӧ�ó���
set workPath=C:\Program Files\TortoiseSVN\bin
set exeName=TortoiseProc.exe
echo Svn����·�� C:\Program Files\TortoiseSVN\bin
::��Ҫ�û��ж��Լ���ǰ����svn�Ŀͻ����Ƿ�Ҳ�����Ŀ¼�±ߣ����û�У�ʹ���û�¼���Ŀ¼
set /p input=Svn����·���Ƿ���ȷ (Y or N):
if /i "%input%"=="Y" goto Y
if /i "%input%"=="N" goto N
:N
::�û�¼����ȷ��Ŀ¼����ת���������
set /p workPath=Svn��װĿ¼=
goto Y
:Y
echo ���ݴ�����
::ʹ��forѭ���� dir ��ȡ���ַ����л�ȡ�ļ�������
:: dir /ad-s/b ��ʾֻȡĿ¼�����Ҳ���ϵͳ�ļ��У�ʹ�ÿո�ģʽ��ʾ
for /f "delims=" %%i in ('"dir /ad-s/b "') do (
echo ���ڲ�ѯ�ļ���%%i���Ƿ����svn��Ϣ
::�ж��Ƿ���svn�ļ���
if exist "%~dp0%%i\.svn\" (
echo ���ڸ�����Ŀ %%i
::���ø�������
"%workPath%\%exeName%" /command:update /path:%%i /notempfile /closeonend:1)
)
echo �������
pause