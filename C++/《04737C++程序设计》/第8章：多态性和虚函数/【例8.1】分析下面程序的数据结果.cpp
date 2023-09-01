#include <iostream>
using namespace std;
const double PI = 3.14159;
class Point{
  private:
    double x, y;
  public:
    Point(double i, double j){
      x = i;
      y = j;
    }
    double area(){
      return 0;
    }
};
class Circle:public Point{
  private:
    double radius;
  public:
    Circle(double a, double b, double r):Point(a, b){
      radius = r;
    }
    double area(){
      return PI * radius * radius;
    }
};
int main(){
  Point a(1.5, 6.7);
  Circle c(1.5, 6.7, 2.5);
  cout << "area of Point is " << a.area() << endl;  // (1)
  cout << "area of Circle is " << c.area() << endl; // (2)
  Point * p = &c; // (3)
  cout << "area of Circle is " << p -> area() << endl;  // (4)
  Point & rc = c; // (5)
  cout << "area of Circle is " << rc.area() << endl;  // (6)
}