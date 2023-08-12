如果dir2目录不存在，则可以直接使用
cp -r dir1 dir2
即可。
如果dir2目录已存在，则也会将dir1目录复制到dir2中，所以需要使用
cp -r dir1/. dir2
