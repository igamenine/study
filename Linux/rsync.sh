# 远程同步修改目录 -a 归档拷贝 -v 显示过程
rsync -av [source_path]/ [user]@[host:target_path]/


# 本地同步修改目录
rsync -av [source_path]/ [target_path]/
# 注意：目标路径如果与源路径为相同路径下，则使用./作为前缀，如：
rsync -av rsync1/ ./rsync2/

# 同步删除操作，如果源路径删除了某些文件，那么目标路径也会删除
rsync -av --delete rsync1/ ./rsync2/

# 同步前忽略指定目录
rsync -av --exclude "cp1/*" --delete rsync1/ ./rsync2/

# 同步前忽略指定文件
rsync -av --exclude "*.txt" --delete rsync1/ ./rsync2/

# 同步前忽略多个文件/目录
rsync -av --exclude={'*.txt','cp1/*'} --delete rsync1/ ./rsync2/

