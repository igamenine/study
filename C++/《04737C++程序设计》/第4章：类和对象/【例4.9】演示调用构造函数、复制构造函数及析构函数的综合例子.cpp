#include <iostream>
using namespace std;
class Point{
  private:
    int X, Y;
  public:
    Point(int a = 0, int b = 0){  // 声明并定义构造函数
      X = a;
      Y = b;
      cout << "Intializing" << endl;
    }
    Point(const Point & p); // 声明复制构造函数
    int GetX(){
      return X;
    }
    int GetY(){
      return Y;
    }
    void Show(){
      cout << "X = " << X << ", Y = " << Y << endl;
    }
    ~Point(){ // 声明并定义析构函数
      cout << "delete... " << X << ", " << Y << endl;
    }
};
Point::Point(const Point & p){  // 定义复制构造函数
  X = p.X;
  Y = p.Y;
  cout << "Copy Initializing" << endl;
}
// 关于display和disp涉及的函数重载问题见第3章3.4.1函数重载
void display(Point p){  // Point类的对象作为函数的形参
  p.Show();
}
void disp(Point & p){ // Point类对象的引用作为函数的形参
  p.Show();
}
Point fun(){  // 声明并定义返回类型为Point的函数fun
  Point A(101, 202);
  return A;
}
int main(){
  Point A(42, 35);  // 初始化Point类型对象A
  Point B(A); // 第1次调用复制构造函数，用A初始化B
  Point C(58, 94);  // 初始化Point类型对象C
  cout << "called display(B)" << endl;
  display(B); // 第2次调用复制构造函数，对象B作为display的实参
  cout << "Next..." << endl;
  cout << "called disp(B)" << endl;
  disp(B);
  cout << "call C = fun()" << endl;
  C = fun();  // 第3次调用复制构造函数，函数fun的返回值赋给对象C
  cout << "called disp(C)" << endl;
  disp(C);
  cout << "out..." << endl;
}