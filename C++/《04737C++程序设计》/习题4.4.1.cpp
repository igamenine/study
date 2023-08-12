#include <iostream>
using namespace std;

class base{
  private:
    int x, y;
  public:
    void init(int a, int b){
      x = a;
      y = b;
    }
    void print(){
      cout << "测试结果：2 * " << x << " - " << y << " = " << 2 * x - y << endl;
    }
};

int main(){
  base a;
  a.init(68, 55);
  a.print();
}