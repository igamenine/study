#include <iostream>
using namespace std;
class test{
  private:
    int n;
  public:
    test(int i){
      n = i;
      cout << "constructor: " << i << endl;
    }
    ~test(){
      cout << "destructor: " << n << endl;
    }
    int getn(){
      return n;
    }
    void inc(){
      ++n;
    }
};
int main(){
  cout << "loop start: " << endl;
  for (int i = 0; i < 3; i++){
    static test a(3); // 局部静态对象创建后生存期跟随主程序，所以只调用一次构造函数
    test b(3);  //局部非静态对象创建后生存期跟随for循环，所以调用3次构造函数
    a.inc();
    b.inc();
    cout << "a.n = " << a.getn() << endl;
    cout << "b.n = " << b.getn() << endl;
    cout << "loop end." << endl;
    cout << "Exit main()" << endl;
  }
}