#include <iostream>
using namespace std;
class A{
  public:
    A(){}
    virtual void func(){
      cout << "Constructing A " << endl;
    }
    ~A(){}
    virtual void fund(){
      cout << "Destructor A " << endl;
    }
};
class B:public A{
  public:
    B(){
      func();
    }
    void fun(){
      cout << "Come here and go...";
      func();
    }
    ~B(){
      fund();
    }
};
class C:public B{
  public:
    C(){}
    void func(){
      cout << "Class C" << endl;
    }
    ~C(){
      fund();
    }
    void fund() {
      cout << "Destructor C " << endl;
    }
};
int main(){
  C c;
  c.fun();
}