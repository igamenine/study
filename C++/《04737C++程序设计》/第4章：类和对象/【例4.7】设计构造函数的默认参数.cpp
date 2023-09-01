#include <iostream>
using namespace std;
class Point{
  private:
    int x, y;
  public:
    Point(int = 0, int = 0);  // 声明两个参数均为默认参数
    void Get(int = 0);  // 函数的默认参数也可以这么声明
};
Point::Point(int a, int b):x(a), y(b){
  cout << "Initializing " << a << ", " << b << endl;
}
void Point::Get(int a){
  cout << a << endl;
}
int main(){
  Point A;
  Point B(15, 25);
  Point C[2];
}