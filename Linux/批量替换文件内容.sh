find -name [文件名] | xargs perl -pi -e 's|[需替换内容]|[替换内容]|g'
find .(路径名) “*[文件名,可模糊匹配]” | xargs perl -pi -e 's|[需替换内容]|[替换内容]|g'
