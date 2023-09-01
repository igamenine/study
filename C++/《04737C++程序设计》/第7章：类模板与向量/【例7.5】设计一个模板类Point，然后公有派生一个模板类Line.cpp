#include <iostream>
using namespace std;
template <typename T>
class Point{
    T x, y;
  public:
    Point(T a, T b){
      x = a;
      y = b;
    }
    void display(){
      cout << x << ", " << y << endl;
    }
};
template <typename T>
class Line:public Point<T>{
    T x2, y2;
  public:
    Line(T a, T b, T c, T d):Point<T>(a, b){
      x2 = c;
      y2 = d;
    }
    void display(){
      Point<T>::display();
      cout << x2 << ", " << y2 << endl;
    }
};
int main(){
  Point<double> a(3.5, 8.8);
  a.display();
  Line<int> ab(4, 5, 6, 7);
  ab.display();
  Line<double> ad(4.5, 5.5, 6.5, 7.5);
  ad.display();
}