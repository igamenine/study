#include <iostream>
using namespace std;
struct Point {
  double x, y;  //数据成员
  void Setxy(double a, double b){ // 成员函数，用来重新设置数据成员
    x = a;
    y = b;
  }
  void Display(){ // 成员函数，按指定格式输出数据局成员的值
    cout << x << "\t" << y << endl;
  }
};

int main(){
  Point a;  // 定义对象a
  a.Setxy(10.6, 18.5);  // 设置对象a的成员函数Setxy
  a.Display();  // 调用对象a的成员函数Display
  cout << a.x << "\t" << a.y << endl; // 手动调用对象a的数据成员
}