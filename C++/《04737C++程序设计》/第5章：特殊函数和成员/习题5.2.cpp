class test{
    const int x;
  public:
    test(int a):x(a){}
    int getx() const {
      return x;
    }
};

#include <iostream>
using namespace std;
int main(){
  test x(1);
  cout << x.getx() << endl;
  return 0;
}