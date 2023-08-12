# flink是2014年apache基金会开源的流数据处理框架，2014年8月flink创始人员创办公司并公布第一个版本（0.6.0），2019年1月被深入研究和使用其技术的阿里巴巴收购。
# 它和spark属于竞争关系，它与spark的区别在于flink侧重于流数据处理，spark侧重于离线数据处理。

# flink具有分层的API，自上而下分别是：
1、SQL（最高层语言）
2、Table API（声明式领域专用语言）
3、DataStream / DataSet API（核心APIs）
4、有状态流处理（底层APIs）
# 其中最重要的是DataStream（是java类，流处理语言），其中DataSet属于批处理语言，但已经要被淘汰了，业界普遍使用DataStream，批处理也会通过DataStream转换来处理。

# 有界流和无界流
无界流：有定义流的开始，但没有定义流的结束。它们会无休止地产生数据。无界流的数据必须持续处理，即数据被摄取后需要立刻处理。我们不能等到所有数据都到达再处理，因为输入是无限的，在任何时候输入都不会完成。处理无界数据通常要求以特定顺序摄取事件，例如事件发生的顺序，以便能够推断结果的完整性。

有界流：有定义流的开始，也有定义流的结束。有界流可以在摄取所有数据后再进行计算。有界流所有数据可以被排序，所以并不需要有序摄取。有界流处理通常被称为批处理ApacheFlink擅长处理无界和有界数据集精确的时间控制和状态化使得Flink的运行时(runtime)能够运行任何处理无界流的应用。有界流则由一些专为固定大小数据集特殊设计的算法和数据结构进行内部处理，产生了出色的性能。

# 查看flink版本
flink --version

# 在zeppelin中，可以使用两种解释器，解释器配置中可以将zeppelin.flink.module.enableHive=true，这样就会优先使用hive语法
%flink.ssql流式 SQL 解释器，它通过以下方式启动 Flink 流作业StreamTableEnvironment
%flink.bsql批处理 SQL 解释器，通过 Flink 批处理作业启动BatchTableEnvironment

