# CentOS配置环境变量可以选择/etc/profile和/etc/profile.d。
# /etc/profile和/etc/profile.d的区别是后者是前者的子集，后者能生效的前提是source /etc/profile，原因是后者的执行是写在/etc/profile里的：
for i in /etc/profile.d/*.sh /etc/profile.d/sh.local ; do
    if [ -r "$i" ]; then
        if [ "${-#*i}" != "$-" ]; then
            . "$i"
        else
            . "$i" >/dev/null
        fi
    fi
done

# 当需要额外配置的应用环境变量不多时可以直接配置/etc/profile，但当应用比较杂时，推荐使用/etc/profile.d/目录，将变量单独以后缀.sh的形式创建在profile.d中，这样会很方便维护。当然配置脚本创建完毕后也要执行：
source /etc/profile