--占比(%) 处罚率
ifnull(if(ifnull(, 0) = 0, ifnull(, 0)*100, ROUND(IFNULL(, 0)/IFNULL(, 0)*100, 2)), 0)
concat(ifnull(if(ifnull(, 0) = 0, ifnull(, 0)*100, ROUND(IFNULL(, 0)/IFNULL(, 0)*100, 2)), 0),  '%')

-- 比例
round(ifnull(, 0) / (ifnull(, 0) + ifnull(, 0))*100, 2)