@REM 以开机启动autohotkey程序为例
1、安装autohotkey
2、生成你需要的autohotkey.ahk文件
3、搜索Convert .ahk to .exe并运行
4、【source】选项选择你的ahk文件，【destination】打开C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
5、点击【convert】即可，下一次电脑开机会自动启动该exe程序

最重要的是第四步，把你要开机启动的文件放到【C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp】路径下，可以是非exe文件，实测doc文件也可以自动打开，只要是系统能执行的文件皆可。