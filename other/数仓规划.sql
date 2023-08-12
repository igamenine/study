-- 本文参考如下网址：
-- https://help.aliyun.com/document_detail/137615.html
-- https://zhuanlan.zhihu.com/p/395519803
-- https://zhuanlan.zhihu.com/p/452681588
-- https://www.saoniuhuo.com/article/detail-72.html
-- https://zhuanlan.zhihu.com/p/359461257


-- ods（Operational Data Store）
数据引入层，亦称原始层，原始数据
-- dim（Dimension）
维度层，亦称字典层，属性数据
-- dwd（Data Warehouse Detail）
明细数据层，亦称标准层，事实数据
-- dws（Data Warehouse Summary）
汇总数据层，亦称聚合层，汇总数据
注：在excel中dws层又称为数据透视表，即数据透视表就是汇总表的意思

规范的数据仓库治理流程的是：
1、引入原始数据建立本地ods层；
2、如果字段有维度属性却没有对应字典，则手动整合出dim层，dim数据要与项目标准统一；
3、将本地ods层数据进行脏数据清洗，根据业务周期流程设计出通用的最细粒度dwd层；
4、根据业务统计需求使用dwd层进行聚合分析，输出能满足通用需求的公共指标dws层；
5、可以根据需要将dws层数据定制化BI为私有指标ads层。


-- 其他名词

-- ETL
ETL，是英文Extract-Transform-Load的缩写，用来描述将数据从来源端经过抽取（extract）、转换（transform）、加载（load）至目的端的过程，简单来说就是【对数据进行清洗的流程】。ETL一词较常用在数据仓库，但其对象并不限于数据仓库。

-- 维度
数据的属性、字典、键值，可以作为统计字段分组的存在
-- 度量
数据的事实、内容、数值，可以作为统计字段计算的存在

-- dmp
离线数据推送平台，将离散数据整合成可以阅读的表并进行管理、推送，是dwd层的一种

-- cdm
通用数据层，亦称中间层，包含dwd、dws、dim层
-- ads
  数据服务层，亦称指标层，满足BI定制化统计需求，如果说dws是公共指标，那ads就是私有指标

-- flow
文件夹

-- job
任务

-- notebook
任务实例

-- parahraph
段落