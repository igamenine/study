#include <iostream>
using namespace std;
class Point{
  private:
    int x, y;
  public:
    Point(int = 0, int = 0);  // 声明两个参数均为默认参数
    ~Point();
    int Getx();
};
Point::Point(int a, int b):x(a), y(b){
  cout << "Initializing " << a << ", " << b << endl;
}
Point::~Point(){
  cout << "Destructor is active" << endl;
}
int Point::Getx(){
  return x;
}
int main(){
  Point A(5, 68);
  cout << A.Getx() << endl;
  cout << "Exiting main " << endl;
}