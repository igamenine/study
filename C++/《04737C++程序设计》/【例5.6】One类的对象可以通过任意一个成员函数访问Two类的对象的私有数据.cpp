#include <iostream>
using namespace std;
class Two{
    int y;
  public:
    friend class One; // 声明One为Two的友元
};
class One{
    int x;
  public:
    One(int a, Two & r, int b){ // 使用One类的构造函数为Two类的对象赋值
      x = a;
      r.y = b;
    }
    void Display(Two &);
};
void One::Display(Two & r){
  cout << x << " " << r.y << endl;
}
int main(){
  Two Obj2;
  One Obj1(23, Obj2, 55);
  Obj1.Display(Obj2);
}