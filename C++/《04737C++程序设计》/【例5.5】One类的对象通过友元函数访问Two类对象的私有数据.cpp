#include <iostream>
using namespace std;
class Two;  // 前向声明Two类存在，不声明类体。注意：仅声明类名不要加{}，否则被视为重定义
class One{
  private:
    int x;
  public:
    One(int a){
      x = a;
    }
    int Getx(){
      return x;
    }
    void func(Two &); // 声明本类的成员函数func的参数为Two类的引用
};
class Two{
  private:
    int y;
  public:
    Two(int b){
      y = b;
    }
    int Gety(){
      return y;
    }
    friend void One::func(Two &); // 声明One类的函数为友元函数
};
void One::func(Two & r){
  r.y = x;
}
int main(){
  One Obj1(5);
  Two Obj2(8);
  cout << Obj1.Getx() << " " << Obj2.Gety() << endl;
  Obj1.func(Obj2);
  cout << Obj1.Getx() << " " << Obj2.Gety() << endl;
}