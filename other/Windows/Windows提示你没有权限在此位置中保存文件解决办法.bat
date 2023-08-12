1.Win+R，输入：gpedit.msc打开【本地组策略编辑器】
如果系统为家庭版导致无法找到gpedit.msc，则新建文本文件复制以下内容后缀名改成bat右键管理员权限执行即可：
@echo off

pushd "%~dp0"

dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt

dir /b C:\Windows\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt

for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"C:\Windows\servicing\Packages\%%i"

pause

2.依次选择【计算机配置】-【Windows设置】-【安全设置】-【本地策略】-【安全选项】，右侧找到【用户账户控制：以管理员批准模式运行所有管理员】，双击
3.将【已启用】改为【已禁用】，点击【应用】
4.重启计算机

此方法也可解决Windows家庭版没有本地组策略编辑器和注册表的问题

转自https://zhuanlan.zhihu.com/p/379682771