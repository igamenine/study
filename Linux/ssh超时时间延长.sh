echo export TMOUT=1000000 >> ~/.bash_profile
source .bash_profile
cp -rf /etc/ssh/sshd_config /etc/ssh/sshd_config_bak
echo ClientAliveInterval=60 >> /etc/ssh/sshd_config
service sshd restart

# http://t.zoukankan.com/mengdeep-p-4851517.html