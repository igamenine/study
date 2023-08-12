# 1、打开【系统偏好设置】— 点击【软件更新】。

# 2、取消选择【自动保持我的Mac最新】。

# 3、然后点击【高级】按钮，取消所有的勾选。

# 4、通过上面步骤设置后，发现底部的小红点还在，则需打开终端。

# 5、打开终端执行如下代码。

# 忽略大版本更新提示：
sudo softwareupdate --ignore "macOS Catalina"
# 忽略小版本更新的方法：
sudo softwareupdate --ignore "macOS Catalina 10.15.4 Update"
# 6、取消小红点
defaults write com.apple.systempreferences AttentionPrefBundleIDs 0
killall Dock
# 7、恢复更新提示
sudo softwareupdate --reset-ignored
defaults write com.apple.systempreferences AttentionPrefBundleIDs 0

# 原文链接：https://blog.csdn.net/yilovexing/article/details/110674356