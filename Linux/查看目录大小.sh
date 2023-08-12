# 我们常用的是du -sh，但是如果查询根目录等大目录效率就比较低，所以使用du -h -x --max-depth=1
du -sh

du -h -x --max-depth=1

# 排除单个文件
du -h -x --max-depth=1 /* --exclude="proc"

# 排除多个文件
du -h -x --max-depth=1 --exclude="proc" --exclude="app"

du -h -x --max-depth=1 \
--exclude="proc" \
--exclude="app" \
...
--exclude="app2"


