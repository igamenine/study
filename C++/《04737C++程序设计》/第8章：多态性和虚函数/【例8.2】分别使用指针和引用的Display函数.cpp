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
    virtual double area(){
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
void Display(Point * p){
  cout << p -> area() << endl;
}
void Display(Point & a){
  cout << a.area() << endl;
}
int main(){
  Point a(1.5, 6.7);
  Circle c(1.5, 6.7, 2.5);
  Point * p = &c;
  Point &rc = c;
  Display(a);
  Display(p);
  Display(rc);
}