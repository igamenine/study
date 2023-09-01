#include <iostream>
using namespace std;
class A{
  private:
    int val;
  public:
    A(int i){
      val = i;
    }
    int value(int a){
      return val + a;
    }
};
int main(){
  int(A::* pfun)(int);  // 声明指向类A中返回类型为int、参数列表为int类型参数的成员函数的指针
  pfun = &A::value; // 指针指向具体的成员函数value
  // int(A::* pfun)(int) = &A::value;  // 可以写到一起
  A obj(10);  // 声明并初始化对象A
  cout << (obj.* pfun)(15) << endl; // 对象使用类的函数指针pfun调用成员函数value
  A * pc = &obj;  // 声明对象A的指针pc
  cout << (pc ->* pfun)(15) << endl;  // 对象指针pc使用类的函数指针pfun调用成员函数value
}