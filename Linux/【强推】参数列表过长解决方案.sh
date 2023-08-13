# 在linux中删除大量文件时，直接用rm会出现：-bash: /bin/rm: 参数列表过长，的错误。
# 这时可以用find命令来结合使用。
# 例：
# 1、rm * -rf 改为:
find . -name "*" -print0| xargs -0 rm -rf
# 2、rm test* -rf 改为:
find . -name "test*" -print0| xargs -0 rm -rf
# mv时报参数列表过长，
for i in *.m;do mv $i ${i%.m};done
# 于是求助于google，探索过程就省略了，直接说解决方法吧：
ls dir1 | xargs -t -I {} mv {} dir2/{}
# 这里的一对大括号是原文给的例子里用的，后来看了参数的用法，其实那对大括号是可以用任意字符串替换的，比如：
ls dir1 | xargs -t -I asdf mv asdf dir2/asdf
# 效果和大括号那一版是完全一样的，就是看起来有点儿不严肃。
# 需要说明的是，上面xargs的第二个参数，是大写的i，读作”爱“的那个字母，不是小写的L。

# mac删除隐藏文件
# 查找并删除文件
find . -name "._*" -print0| xargs -0 rm -rf
find . -name "._*" -exec rm -rf {} \;
find . -name "._*" -delete