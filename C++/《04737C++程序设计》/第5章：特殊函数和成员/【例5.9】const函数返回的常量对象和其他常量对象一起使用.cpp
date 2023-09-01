#include <iostream>
using namespace std;
class ConstFun{
  public:
    int f5() const{
      return 5;
    }
    int Obj(){
      return 45;
    }
};
int main(){
  ConstFun s;
  const int i = s.f5();
  const int j = s.Obj();  // 注意：这里常量j只是利用了非常量成员函数s.Obj()返回的值，而非调用s.Obj()函数，所以是合法的
  int x = s.Obj();
  int y = s.f5();
  cout << i << " " << j << " " << x << " " << y;
  const ConstFun d;
  int k = d.f5();
  cout << " k = " << k << endl;
}