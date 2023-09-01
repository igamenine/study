#include <iostream>
using namespace std;
class Point{
  public:
    int x, y;
    Point(int = 0, int = 0);  // 声明两个参数均为默认参数
};
Point::Point(int a, int b):x(a), y(b){
  cout << "Initializing " << a << ", " << b << endl;
}
int main(){
  Point B(15, 25);
  Point copy_B(B);
  cout << "原始对象B的x和y的内存地址分别是" << &B.x << " " << &B.y << endl;
  cout << "copy_B的x和y的内存地址分别是" << &copy_B.x << " " << &copy_B.y << endl;
}