#include <iostream>
using namespace std;
struct test1{
  int x;
  char y;
};
class test2{
  public:
    int x;
    char y;
};
class Point{
  public:
    int x;
    char y;
    Point();
};
Point::Point(){}
int main(){
test1 a;
test2 b;
Point c[0];
cout << a.x << "|" << a.y << "|" << endl;
cout << b.x << "|" << b.y << "|" << endl;
cout << c[0].x << "|" << c[0].y << "|" << endl;
}