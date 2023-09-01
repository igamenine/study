#include <iostream>
using namespace std;
class Point{
  private:
    int x, y;
  public:
    Point();  // 使用参数列表声明不带参数的构造函数
    Point(int, int);  // 使用参数列表声明带2个参数的构造函数
};
Point::Point():x(0), y(0){  // 定义不带参数的构造函数，
  cout << "Intializing default" << endl;
}
Point::Point(int a, int b):x(a), y(b){  // 定义带2个参数的构造函数
  cout << "Intializing " << a << ", " << b << endl;
}
Point global(5, 7); // 见【例4.5】的全局对象例子,对象名称global随意，主要是定义在main作全局对象
int main(){
  Point A;  // 使用不带参数的构造函数产生对象A
  Point B(15, 25);  // 使用带参数的构造函数产生对象B
  Point C[2]; // 使用不带参数的构造函数产生对象数组C
  Point D[2] = {  // 使用带参数的构造函数产生对象数组D
    Point(5, 7), Point(8, 12)
  };
}