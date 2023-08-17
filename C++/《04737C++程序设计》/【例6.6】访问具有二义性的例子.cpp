#include <iostream>
using namespace std;
class A{
  public:
    void func(){
      cout << "a.func" << endl;
    }
};
class B{
  public:
    void func(){
      cout << "b.func" << endl;
    }
    void gunc(){
      cout << "b.gunc" << endl;
    }
};
// class C:public A, public B{
//   public:
//     void gunc(){
//       cout << "c.gunc" << endl;
//     }
//     void hunc(){
//       func(); // 基类A和基类B都有func函数，会引发二义性错误
//     }
// };
class C:public A, public B{
  public:
    void gunc(){
      cout << "c.gunc" << endl;
    }
    void hun1(){
      A::func();  // 单独单用基类A的func函数，不会引发二义性错误
    }
    void hun2(){
      B::func();  // 单独单用基类B的func函数，不会引发二义性错误
    }
};
int main(){
  C obj;
  obj.A::func();
  obj.B::func();
  obj.B::gunc();
  obj.C::func();
  obj.gunc();
  obj.hun1();
  obj.hun2();
};