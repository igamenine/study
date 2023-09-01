#include <iostream>
using namespace std;
struct Point{
  private:
    double x, y;
  public:
    Point(){

    };
    Point(double a, double b){
      x = a, y = b;
    }
    void Setxy(double a, double b){
      x = a, y = b;
    }
    void Display(){
      cout << x << "\t" << y << endl;
    }
};

int main(){
  Point a;
  Point b(18.5, 10.6);
  a.Setxy(10.6, 18.5);
  a.Display();
  b.Display();
}