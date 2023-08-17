#include <iostream>
using namespace std;
class Point{
  private:
    int x, y;
  public:
    Point(int a, int b){
      x = a;
      y = b;
      cout << "Point..." << endl;
    }
    void Showxy(){
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
    Rectangle(int a, int b, int h, int w):Point(a, b){  // 构造函数初始化列表
      H = h;
      W = w;
      cout << "Rectangle..." << endl;
    }
    void Show(){
      cout << "H = " << H << ", W = " << W << endl;
    }
    ~Rectangle(){
      cout << "Delete Rectangle" << endl;
    }
};
int main(){
  Rectangle r1(3, 4, 5, 6);
  r1.Showxy();  // 派生类对象调用基类的成员函数
  r1.Show();  // 派生类对象调用派生类的成员函数
}