前一天的日期
date -d "1 day ago" +"%Y%m%d"

前一个月的日期
date -d "1 month ago" +"%Y%m%d"

类似的还有
date -d "-1 day ago 1 month ago" +"%Y%m%d"
date -d "1 day ago -1 year ago 1 month ago" +"%Y%m%d"


下面是SHELL的例子：
DAYDEL=`date -d "1 month ago" +%m%d`   //一个月前的日期
echo $DAYDEL
