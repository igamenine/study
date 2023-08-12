# 改变文件或目录的所属群组chgrp
ll
# ---xrw-r-- 1 root root 302108 11-13 06:03 log2012.log
chgrp -v bin log2012.log
ll
# ---xrw-r-- 1 root bin  302108 11-13 06:03 log2012.log