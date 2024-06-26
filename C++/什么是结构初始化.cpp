// 在C++中，结构体可以通过多种方式进行初始化，包括默认初始化、成员初始化、聚合初始化和列表初始化。

// 1. 默认初始化

// 默认初始化是指在定义结构体对象时未显式提供初始值，而由编译器自动对其进行初始化。对于基本数据类型，会被初始化为0或者空；对于自定义类型，会调用其默认的构造函数进行初始化。

// ```c++
struct Point {
  int x;
  int y;
};

int main() {
  Point p; // 默认初始化，p.x 和 p.y 都是未知值
  return 0;
}
// ```

// 2. 成员初始化

// 成员初始化是指在定义结构体对象时为其各个成员变量分别提供初始值。我们可以通过在定义结构体对象时使用花括号{}，并将各个成员变量的初始值按照顺序或名称进行排列来实现成员初始化。

// ```c++
struct Point {
  int x;
  int y;
};

int main() {
  Point p = {10, 20}; // 成员初始化，p.x 和 p.y 分别为 10 和 20
  return 0;
}
// ```

// 3. 聚合初始化

// 聚合初始化是指利用花括号{}为结构体对象直接赋值的一种方式，它可以快速地初始化一个结构体对象，并且可以省略成员变量的名称，只需按照成员变量的顺序进行初始化即可。聚合初始化只适用于符合以下条件的结构体：

// - 所有成员变量都是public；
// - 没有定义任何构造函数；
// - 没有基类、virtual函数和非静态成员变量。

// ```c++
struct Point {
  int x;
  int y;
};

int main() {
  Point p{30, 40}; // 聚合初始化，p.x 和 p.y 分别为 30 和 40
  return 0;
}
// ```

// 4. 列表初始化

// 列表初始化是指利用花括号{}和冒号:为结构体对象调用构造函数并传递参数的一种方式。与成员初始化类似，列表初始化也可以按照成员变量的顺序或名称进行排列。需要注意的是，当我们为结构体定义了构造函数时，列表初始化是最常用的初始化方式之一。

// ```c++
struct Point {
  int x;
  int y;

  Point(int x0, int y0) : x(x0), y(y0) {}
};

int main() {
  Point p = {10, 20}; // 列表初始化，调用Point的构造函数进行初始化
  return 0;
}
// ```

// 上述例子中，我们为Point结构体定义了一个构造函数，它接受两个整数类型的参数，并将它们分别赋值给x和y成员变量。然后，在main函数中，我们创建了一个Point类型的对象p，并使用花括号{}和冒号:来调用其构造函数进行初始化。