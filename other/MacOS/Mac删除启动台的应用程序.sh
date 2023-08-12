# 1、应用程序是从App Store上下载的
    打开「启动台」，长按App即可删除。
# 2、应用程序不是从App Store上下载的
    # macOS12及以下版本：
    先下载腾讯的清理管家「Lemon」，
    然后打开「访达」，选择「应用程序」，
    找到你要删除的App右键「移到废纸篓」，
    「Lmeon」会在右上角提示你有「残留文件」，
    点击「清理」即可。
    # 注意：如果不安装「Lemon」或其他同类应用程序，会残留大量垃圾文件，比如《梦幻西游》mac版会将游戏本体下载到「文稿」中与应用程序里的启动文件分离，很恶心

    # macOS13及以上版本：
    点击「设置」，选择「通用」，选择「存储空间」，
    点击「应用程序」后面的「i」按钮，
    找到你想删除的app并选择「删除」。
# 3、应用程序是其他应用程序派生的扩展内容
    比如Chrome可以派生网站快捷app，这个不是正经的应用程序，
    想删除的话使用「Command (⌘) 」+「空格键」打开「聚焦」，
    搜索该扩展内容名称，按住「Command (⌘) 」左键点击访问文件位置，
    右键点击找到的文件，选择「移到废纸篓」，然后「清空废纸篓」即可。
# 4、应用程序是残留文件
    有时候通过正规方式无法彻底删除，如战网app会在启动台残留文件Agent，
    想要删除的话需要选择「访达」，点击左上角的「文件」，
    选择「新建智能文件夹」打开「访达」的搜索界面，
    搜索残留文件的名字，将跟该文件相关性强的搜索结果都范围选中，
    右键「移到废纸篓」，查看「启动台」中的残留应用程序是否消失，
    没消失则继续删除，直到应用程序图标消失，再检查是否误删文件，
    最后「清空废纸篓」（如果有安装「Lemon」则可以使用它的「彻底删除」功能。
# 5、「启动台」恶性残留应用程序
    即使使尽浑身解数依然无法让残留应用程序消失，
    那就选择在数据库记录层面对残留文件下杀手，
    打开「终端」，使用以下命令进入系统数据库路径（每个人的路径可能不一样）
    cd /private/var/folders/99/47qq65qx4w50vrgly07lvfdh0000gn/0/com.apple.dock.launchpad/db
    替换title中的名字，运行以下命令
    sqlite3 db "delete from apps where title='GalaxyUpdater';" && killall Dock
    # 注：删除图标会打乱图标排序，需要手动重新整理，非强迫症不推荐使用。