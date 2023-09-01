#include <iostream>
using namespace std;
class base{
  public:
    virtual void print(){
      cout << "in base" << endl;
    }
};
class derived:public base{
  public:
    void print(){
      cout << "in derived" << endl;
    }
};
void display(base * pb, void(base::* pf)()){
  (pb ->* pf)();
}
int main(){
  derived d;
  base * pb = &d;
  void(base::* pf)(); // 声明指向类base成员函数的指针pf
  pf = &base::print; // 指针pf指向具体的成员函数print
  display(pb, pf);  // 调用display函数使用指针调用指向类函数指针pf
  (d.* pf)(); // 使用对象调用指向类函数指针pf
  base & a = d;
  (a.* pf)(); // 使用对象引用调指向类函数指针pf
}