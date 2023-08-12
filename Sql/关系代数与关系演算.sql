
关系代数是SQL之外还有一种描写叙述数据库操作的形式化语言，关系变量（表）是关系代数中的基本表达式
如下例：
r⋈s=Πr.A,r.B,r.C,r.D,s.E(ρr.B=s.B∧r.D=s.D(r×s))

关系演算是SQL、关系代数之外的又一种描写叙述数据库操作的形式化语言，关系演算基本操作对象是范围变量（Range Variable，是关系变量/表的逻辑表达的别称）
如下例：
<quantified boolean exp>::= 
EXISTS <range var name>(<boolean exp>)| 
FORALL <range var name>(boolean exp>)

更多参见https://www.cnblogs.com/claireyuancy/p/7217371.html