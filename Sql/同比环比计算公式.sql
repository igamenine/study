-- 同比环比 同比(%) 环比(%) （当前-同期）/同期
ifnull(ROUND((IFNULL(,0)-IFNULL(,0))/IFNULL(,0)*100,2),0)
-- 加百分比号
concat(ifnull(ROUND((IFNULL(,0)-IFNULL(,0))/IFNULL(,0)*100,2),0),'%')
-- 同期为0本期大于0
concat(if(ifnull(,0)=0,ifnull(,0)*100,ifnull(ROUND((IFNULL(,0)-IFNULL(,0))/IFNULL(,0)*100,2),0)),'%')