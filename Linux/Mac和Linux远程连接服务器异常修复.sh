# 报错代码
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ECDSA key sent by the remote host is
SHA256:8hgJ8jpcBr1tm6HS72FpXwMrjba8MQqlqYJQLPB/Qf4.
Please contact your system administrator.
Add correct host key in /Users/wangdong/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /Users/wangdong/.ssh/known_hosts:26
ECDSA host key for 47.98.233.15 has changed and you have requested strict checking.
Host key verification failed.

# 原因是远程机子重装系统后供ssh使用的密钥变了，但是本地保存的互信密钥记录中还存在导致密钥匹配失败
# 解决办法是将错误的密钥信息给清理掉，打开known_hosts文件根据IP或hostname找到对应密钥删除保存即可
vi /Users/wangdong/.ssh/known_hosts
