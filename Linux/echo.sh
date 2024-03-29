# echo打印指定的字符串
echo string
# 识别转义符
echo -e string
echo -e 1"\n"2
# 加密字符串
echo string | base64/md5sum

# 使用-e选项时，若字符串中出现以下字符，则特别加以处理，而不会将它当成一般文字输出：
# \a 发出警告声；
# \b 删除前一个字符；
# \c 不产生进一步输出 (\c 后面的字符不会输出)；
# \f 换行但光标仍旧停留在原来的位置；
# \n 换行且光标移至行首；
# \r 光标移至行首，但不换行；
# \t 插入tab；
# \v 与\f相同；
# \\ 插入\字符；
# \nnn 插入 nnn（八进制）所代表的ASCII字符；