很多时候我们有的代码用C++提交通过了，但是G++却失败了呢？众所周知，不同的编译器，会对代码做出一些不同的优化。举一个最简单的例子。针对单个语句（注意，是单个语句，不是包含在语句中的那种前++和后++）：

a: a++;b: ++a;
一般的讲，我们都知道，这两条语句的最终结果是一样的，就是a自己增加了1。但是，两者的差距还是有的。如果从标准C的角度去理解。a++这个语句等同于

a: a = a + 1
也就是说，我是先调用，再自增。在调用过程中，会申请一个新的数据地址，用于存放临时的变量a'，然后在把a'加1，之后在把a'赋值给a。

但是++a这个语句不需要这么麻烦。因为他是先自增，后调用，也就是省去了申请新地址的功夫。所以理论上，二者的时间消耗是有差异的，如果你是使用标准C的编译方式，就可以发现这个差异。毕竟，申请临时内存这个操作耗费的时间，远远比令已知内存的数据进行一个改变要长的多。

但是编译器的优化就体现在了这种本身结果相同却耗时有差异的地方。如果你使用gcc来编译，结果你会发现前++与后++二者基本上没有差异。这就是编译器的优化中的冰山一角了。事实上还有很多优化的地方。