#include <iostream>
using namespace std;
class Point{
  private:
    int x, y;
  public:
    Point(int a, int b){
      x = a;
      y = b;
    }
    void Show(){
      cout << "x = " << x << ", y = " << y << endl;
    }
};
class Rectangle:private Point{
  private:
    int H, W;
  public:
    Rectangle(int a, int b, int h, int w):Point(a, b){
      H = h;
      W = w;
    }
    void Show(){
      Point::Show();
      cout << "H = " << H << ", W = " << W << endl;
    }
};
class Test:public Rectangle{
  public:
    Test(int a, int b, int h, int w):Rectangle(a, b, h, w){
      void Show(){
        Rectangle::Show();
      }
    }
};