# 查看硬件时间
hwclock --show
# 查看系统时间
date
# 根据系统时间设置硬件时间
hwclock  -w
# 根据硬件时间设置系统时间
hwclock -s
# 手动设置硬件时间
hwclock --set --date="2023-08-23 16:49:00"
# 手动设置系统时间
date -s  "2023-08-23 16:49:00"
