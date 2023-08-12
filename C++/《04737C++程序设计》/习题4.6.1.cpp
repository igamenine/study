#include <iostream>
using namespace std;
class Point{
  private:
    int x, y;
  public:
    Point(int a, int b):x(a), y(b){}
    void Getxy(){
      cout << "(" << x << ", " << y << ")" << endl; 
    }
    int Getx(){
      return x;
    }
    int Gety(){
      return y;
    }
};
class Rectangle{
  private:
    Point p1, p2, p3, p4;
  public:
    Rectangle(int x1, int y1, int x2, int y2):p1(x1, y1), p2(x2, y2), p3(x1, y2), p4(x2, y1){}
    int GetHight(){
      return (p1.Gety() >= p2.Gety())? (p1.Gety() - p2.Gety()):(p2.Gety() - p1.Gety());
    }
    int GetWidth(){
      return (p1.Getx() >= p2.Getx())? (p1.Getx() - p2.Getx()):(p2.Getx() - p1.Getx());
    }
    void GetPoint(){
      p1.Getxy();
      p2.Getxy();
      p3.Getxy();
      p4.Getxy();
    }
    int GetArea(){
      return GetHight() * GetWidth();
    }
};
int main(){
  Rectangle ra(1, 2, 3, 4);
  cout << "矩形ra的4个坐标值分别是：" << endl;
  ra.GetPoint();
  cout << "矩形ra的面积是：" << ra.GetArea() << endl;
  return 0;
}