class Test{
    int num;
    double f1;
  public:
    Test(int n){
      num = n;
    }
    Test(int n, double f){
      num = n;
      f1 = f;
    }
    int GetNum(){
      return num;
    }
    double GetF(){
      return f1;
    }
};
#include <iostream>
using namespace std;
int main(){
  Test * one[2] = {new Test(2), new Test(4)};
  Test * two[2] = {new Test(1, 3.2), new Test(5, 9.5)};
  for (int i = 0; i < 2; i++)
    cout << "one[" << i << "] = " << one[i] -> GetNum() << endl;
  for (int i = 0; i < 2; i++)
    cout << "two[" << i << "] = (" << two[i] -> GetNum() << ", " << two[i] -> GetF() << ")" << endl;
  // 程序执行完毕后，不要忘记手动释放new对象占用的内存空间
  for (int i = 0; i < 2; i++) { 
    delete one[i];
  }
  for (int i = 0; i < 2; i++) {
    delete two[i];
  }
}