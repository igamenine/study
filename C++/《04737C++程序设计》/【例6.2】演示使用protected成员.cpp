#include <iostream>
using namespace std;
class Point{
  protected:
    int x, y;
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
class Rectangle:public Point{
  private:
    int H, W;
  public:
    Rectangle(int, int, int, int);
    void Show(){
      cout << "x = " << x << ", y = " << y << ", H = " << H << ", W = " << W << endl;
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
  Point a(3, 4);
  Rectangle r1(3, 4, 5, 6);
  a.Show();  // 基类对象调用基类的Show函数
  r1.Show();  // 派生类对象调用派生类的Show函数
}