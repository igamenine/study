方法一：
1、shutdown immediate;

2、startup mount;

3、alter database open;

方法二：
1、shutdown immediate;

2、startup mount;

3、recover database using backup controlfile;

4、指定日志：输入你的最新的日志文件位置。

5、alter database open resetlogs;

6、shutdown immediate;

7、startup;

转自https://jingyan.baidu.com/article/90bc8fc89f3a5ff653640c27.html