@echo off
rem �����ù�ϵͳʱ��ͬ�����������
if "%OS_TIME_HAS_SYNC%" == "y" goto gotoEnd

echo ----��׼������ϵͳʱ��ͬ�����

set REGISTRY_HOME=%~dp0\registry
rem ͬ������ϵͳʱ��
reg import %REGISTRY_HOME%\sync_os_time.reg

rem ֹͣ�����Ʒ���
echo ׼��ֹͣ�����Ʒ����ڷǹ����ƻ����£���һ�л���ʾ����������Ч������Ϊ��������
net stop Ec2Config
ping -n 3 127.0.0.1 >nul

rem ֹͣϵͳʱ��ͬ������
echo ׼��ֹͣϵͳʱ��ͬ������
net stop W32Time
ping -n 3 127.0.0.1 >nul

rem ����ϵͳʱ��ͬ������
echo ׼������ϵͳʱ��ͬ������
net start W32Time
ping -n 3 127.0.0.1 >nul

rem ���������Ʒ���
echo ׼�����������Ʒ����ڷǹ����ƻ����£���һ�л���ʾ����������Ч������Ϊ��������
net start Ec2Config

rem ���ϵͳʱ��ͬ�����Ϊ������
set OS_TIME_HAS_SYNC=y

echo ----��ϵͳʱ��ͬ������������

:gotoEnd