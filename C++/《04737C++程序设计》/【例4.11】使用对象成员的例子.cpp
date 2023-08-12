#include <iostream>
using namespace std;
class Point{
    int x, y;
  public:
    void Set(int a, int b){
      x = a;
      y = b;
    }
    int Getx(){
      return x;
    }
    int Gety(){
      return y;
    }
};
class Rectangle{
    Point Loc;
    int H, W; // H为高，W为宽
  public:
    void Set(int x, int y, int h, int w);
    Point * GetLoc(); // 声明返回Point类指针的成员函数
    int GetHeight(){
      return H;
    }
    int GetWidth(){
      return W;
    }
};
void Rectangle::Set(int x, int y, int h, int w){
  Loc.Set(x, y);
  H = h;
  W = w;
}
Point * Rectangle::GetLoc(){  // 返回类型Point * 作为Rectangle的成员函数
  return &Loc;  // 返回对象Loc的地址
}
int main(){
  Rectangle rect;
  rect.Set(10, 2, 25, 20);
  cout << rect.GetHeight() << ", " << rect.GetWidth() << ", ";
  Point * p = rect.GetLoc();  // 定义Point类的指针对象p并初始化
  cout << p -> Getx() << ", " << p -> Gety() << endl;
}