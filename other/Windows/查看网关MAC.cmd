@REM 查询网络信息，找到网关IP
ipconfig /all
@REM 通过网关IP查询网关MAC
arp -a
@REM 除此之外可以登录路由器后台界面查询LAN口设置查询网关MAC