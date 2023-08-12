# 大小写转换
# 将PARAMETER第一个字符改为大写
${PARAMETER^}
# 将PARAMETER所有字符改为大写
${PARAMETER^^}
# 将PARAMETER第一个字符改为小写
${PARAMETER,}
# 将PARAMETER所有字符改为小写
${PARAMETER,,}
# 将PARAMETER第一个字符颠倒大小写
${PARAMETER~}
# 将PARAMETER所有字符颠倒大小写
${PARAMETER~~}

# 查找PREFIX开头的所有系统变量，以空格分隔
${!PREFIX*}
${!PREFIX@}


# 移除PARAMETER开头第一个PATTERN出现的部分
${PARAMETER#*PATTERN}
# 移除PARAMETER开头最后一个PATTERN出现的部分
${PARAMETER##*PATTERN}
# 移除PARAMETER末尾第一个PATTERN出现的部分
${PARAMETER%PATTERN*}
# 移除PARAMETER末尾最后一个PATTERN出现的部分
${PARAMETER%%PATTERN*}
# 例子1：如果PARAMETER是【1.2.3】，PATTERN是【.】，那么使用#结果是2.3，使用##结果是3，使用%结果是1.2，使用%%结果是1
# 例子2（提取文件名/后缀名）：如果PARAMETER是【linux_bash.sh】，PATTERN是【.】，那么使用#结果是sh，使用%结果是linux_bash
# 例子3（提取文件名/目录）：如果PARAMETER是【/home/toby/linux_bash.sh】，PATTERN是【/】，那么使用##结果是linux_bash.sh，使用%结果是/home/toby

# 将PARAMETER第一个PATTERN替换成STRING
${PARAMETER/PATTERN/STRING}
# 将PARAMETER所有PATTERN替换成STRING
${PARAMETER//PATTERN/STRING}
# 将PARAMETER第一个PATTERN替换成空字符串
${PARAMETER/PATTERN}
# 将PARAMETER所有PATTERN替换成空字符串
${PARAMETER//PATTERN}

# 返回PARAMETER长度（汉字也只算1个字符长度）
${#PARAMETER}

# 截取PARAMETER中OFFSET开始到结束的字符串
${PARAMETER:OFFSET}
# 截取PARAMETER中OFFSET开始LENGTH位的字符串
${PARAMETER:OFFSET:LENGTH}

# 变量PARAMETER不存在或为空时使用WORD内容
${PARAMETER:-WORD}
# 变量PARAMETER不存在时使用WORD的内容
${PARAMETER-WORD}

# 变量PARAMETER不存在或为空时赋值WORD的内容（存在时不赋值）
${PARAMETER:=WORD}
# 变量PARAMETER不存在时赋值WORD的内容（存在时不赋值）
${PARAMETER=WORD}


# 变量PARAMETER存在且不为空时返回WORD的内容（不存在时不赋值）
${PARAMETER:+WORD}
# 变量PARAMETER存在时返回WORD的内容（不存在时不赋值）
${PARAMETER+WORD}

# 转自https://www.jianshu.com/p/c623ef6f2342