#进入系统数据库路径
cd /private/var/folders/99/47qq65qx4w50vrgly07lvfdh0000gn/0/com.apple.dock.launchpad/db
#替换title中的名字，运行以下命令（注：删除图标会打乱图标排序，需要手动重新整理）
sqlite3 db "delete from apps where title='GalaxyUpdater';" && killall Dock
