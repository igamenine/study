#include <iostream>
using namespace std;
class Point{
  private:
    int x, y;
  public:
    Point();  // 使用参数列表声明不带参数的构造函数
    Point(int, int);  // 使用参数列表声明带2个参数的构造函数
};
Point::Point():x(0), y(0){  // 定义不带参数的构造函数
  cout << "Intializing default" << endl;
}
Point::Point(int a, int b):x(a), y(b){  // 定义带2个参数的构造函数
  cout << "Intializing " << a << ", " << b << endl;
}

int main(){
  Point * ptr1 = new Point;
  Point * ptr2 = new Point(5, 7);
  delete ptr1;
  delete ptr2;
}