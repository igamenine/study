# 总核数 = 物理CPU个数 X 每颗物理CPU的核数 
# 总逻辑CPU数 = 物理CPU个数 X 每颗物理CPU的核数 X 超线程数

# 查看物理CPU个数
cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l

# 查看每个物理CPU中core的个数(即CPU核数)
cat /proc/cpuinfo| grep "cpu cores"| uniq

# 查看逻辑CPU的个数
cat /proc/cpuinfo| grep "processor"| wc –l

 查看CPU信息（型号）
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
1.	 查看物理cpu个数
grep 'physical id' /proc/cpuinfo | sort -u

2.	2
查看核心数量
grep 'core id' /proc/cpuinfo | sort -u | wc -l
3.	3
查看线程数
grep 'processor' /proc/cpuinfo | sort -u | wc -l
