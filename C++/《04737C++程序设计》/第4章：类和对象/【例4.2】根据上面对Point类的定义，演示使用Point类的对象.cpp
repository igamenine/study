#include <iostream>
using namespace std;
class Point{
  private:
    int x, y;
  public:
    void Setxy(int a, int b);
    void Move(int a, int b);
    void Display();
    int Getx();
    int Gety();
    int a;
};
void Point::Setxy(int a, int b){
  x = a;
  y = b;
}
void Point::Move(int a, int b){
  x = x + a;
  y = y + b;
}
void Point::Display(){
  cout << x << ", " << y << endl;
}
int Point::Getx(){
  return x;
}
int Point::Gety(){
  return y;
}
void print(Point a){
  a.Display();
}
int main(){
  Point A, B;
  A.Setxy(25, 55);
  B = A;  // B的数据成员取A的数据成员的值
  A.Display();
  A.Move(-10, 20);
  print(A);
  print(B);
  cout << A.Getx() << endl; // 只能使用A.Getx() 不能使用A.x
  A.a = 100;
  cout << A.a << endl;
}