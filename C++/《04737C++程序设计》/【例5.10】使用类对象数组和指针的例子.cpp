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
  Test one[2] = {2, 4}, * p;
  Test two[2] = {Test(1, 3.2), Test(5, 9.5)};
  for (int i = 0; i < 2; i++)
    cout << "one[" << i << "] = " << one[i].GetNum() << endl;
  p = two;
  for (int i = 0; i < 2; i++, p++)
    cout << "two[" << i << "] = (" << p -> GetNum() << ", " << p -> GetF() << ")" << endl;  // 指针p地址已变动，不需要p+1等等
}