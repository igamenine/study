class Test{
    static int x; // 声明静态数据成员
    int n;
  public:
    Test(){}
    Test(int a, int b){ // 只有构造函数才能使用初始化列表方法初始化数据成员
      x = a;
      n = b;
    }
    static int func(){  // 声明有返回值的静态成员函数
      return x;
    }
    static void sfunc(Test & r, int a){ // 声明无返回值的静态成员函数
      r.n = a;
    }
    int Getn(){ // 声明非静态成员函数
      return n;
    }
};
int Test::x = 25; // 初始化静态数据成员
#include <iostream>
using namespace std;
int main(){
  cout << Test::func(); // x在产生对象之前即存在，输出25
  Test b, c;  // 声明对象b和对象c
  b.sfunc(b, 58); // 调用函数为对象b.n赋值
  cout << " " << b.Getn();  // 返回b.n
  cout << " " << b.func();  // 返回b.x
  cout << " " << c.func();  // 返回c.x
  Test a(24, 56); // 声明并初始化对象c，调用构造函数修改静态数据成员x
  cout << " " << a.func() << " " << b.func() << " " << b.func() << endl;
}