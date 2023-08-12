# ll时间格式变更
# 1，临时更改显示样式，当会话结束后恢复原来的样式：
export TIME_STYLE='+%Y-%m-%d %H:%M:%S'
# 2，永久改变显示样式，更改后的效果会保存下来
# 修改/etc/profile文件，在文件内容末尾加入
vim /etc/profile
export TIME_STYLE='+%Y-%m-%d %H:%M:%S'
# 3，执行如下命令，使你修改后的/etc/profile文件配置内容生效
source /etc/profile