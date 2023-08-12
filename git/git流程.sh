#前往对应页面生成仓库源，获得仓库源地址
#全局设置用户标识符
git config --global user.name "username"
git config --global user.email "email"
#GitHub初始化要做一次
# 1. 进入Setting
# 2. 拉到最后的Developer settings
# 3. 点击 Personal access tokens
# 4. 生成token ：Generate new token
# 5. 设置名字、token时长（最后一个选项是永不过期）
# 6、勾选repo、workflows、gist、user，最后点击Generate token
# 7. 复制好token，最好保存好
# 8. 回到git进行设置
# // <your_token>：刚刚生成的token
# // <REPO>：要访问的仓库名称，当前仓库的名称
git remote set-url origin  https://<your_token>@github.com/<USERNAME>/<REPO>.git
#GitHub创建git仓库
mkdir [仓库目录名]
cd [仓库目录名]
git init 
touch README.md
echo "# [仓库目录名]" >> README.md
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin [你的git仓库地址]
git push -u origin main


#gitee创建git仓库
mkdir [仓库目录名]
cd [仓库目录名]
git init 
touch README.md
echo "# [仓库目录名]" >> README.md
git add README.md
git commit -m "first commit"
git remote add origin [你的git仓库地址]
git push -u origin "master"

#如果报错origin已存在则执行，如果有多个仓库源可变更origin别名新增
git remote rm origin

#github提交更改,需要提前做好初始化工作
git add [提交的文件或者目录]
git commit -m "提交版本号"
git push -u origin main

#gitee提交更改，初次提交需要提供用户名和密码，注意不是邮箱
git add [提交的文件或者目录]
git commit -m "提交版本号"
git push -u origin "master"

#克隆项目
git clone --recursive [项目地址]