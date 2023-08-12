# 查看硬件时间
hwclock --show
# 查看系统时间
date
# 根据系统时间设置硬件时间
hwclock  -w
# 根据硬件时间设置系统时间
hwclock -s
# 手动设置硬件时间
hwclock --set --date="2013-12-24 00:01:00"
# 手动设置系统时间
date -s  "2013-12-24 00:01:00"
