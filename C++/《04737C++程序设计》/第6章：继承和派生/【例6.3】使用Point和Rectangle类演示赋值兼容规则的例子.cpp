#include <iostream>
using namespace std;
class Point{
  protected:
    int x, y;
    static int s;
  public:
    Point(int a, int b){
      x = a;
      y = b;
      cout << "Point..." << endl;
    }
    void Show(){  // 基类的Show函数，输出自己的x和y值
      cout << "x = " << x << ", y = " << y << endl;
    }
    ~Point(){
      cout << "Delete Point " << endl;
    }
};
int Point::s = 100;
class Rectangle:public Point{
  private:
    int H, W;
  public:
    Rectangle(int, int, int, int);
    void Show(){
      cout << "x = " << x << ", y = " << y << ", H = " << H << ", W = " << W << endl;
      cout << "s = " << Rectangle::s << endl;
    }
    ~Rectangle(){
      cout << "Delete Rectangle" << endl;
    }
};
Rectangle::Rectangle(int a, int b, int h, int w):Point(a, b){  // 定义构造函数初始化列表
      H = h;
      W = w;
      cout << "Rectangle..." << endl;
    }
int main(){
  Point a(1, 2);
  Rectangle b(3, 4, 5, 6);
  a.Show();  // 基类对象调用基类的Show函数
  b.Show();  // 派生类对象调用派生类的Show函数
  Point & ra = b; // 派生类对象初始化基类的引用
  ra.Show();  // 实际调用的是基类的Show函数
  Point * p = &b; // 派生类对象的地址赋给指向基类的指针
  p -> Show();  // 实际调用的是基类的Show函数
  Rectangle * pb = &b;  // 派生类指针pb
  pb -> Show(); // 调用派生类的Show函数
  a = b;  // 派生类对象的属性值更新基类对象的属性值
  a.Show(); // 基类对象调用基类的Show函数
}