#include <iostream>
using namespace std;
class Point{
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
// 使用类产生对象的方式如结构一样，可以使用如下的主函数，将得到相同的运行结果。
int main(){
  Point a;
  Point b(18.5, 10.6);
  a.Setxy(10.6, 18.5);
  a.Display();
  b.Display();
}