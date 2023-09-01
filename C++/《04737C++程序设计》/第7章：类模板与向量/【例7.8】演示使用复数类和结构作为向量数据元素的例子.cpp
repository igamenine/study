#include <iostream>
#include <complex>
#include <vector>
#include <iterator>
using namespace std;
struct st{
    int a, b;
}a[] = {{2, 5}, {4, 8}};
int main(){
  complex<float> num[] = {complex<float> (2, 3), complex<float> (3.5, 4.5)};
  vector<complex<float> * > vnum(2);  // 复数类的指针作为向量的数据类型
  vnum[0] = &num[0];
  vnum[1] = &num[1];
  for (int i = 0; i < 2; i++)
    cout << "real is " << vnum[i] -> real() << ", image is " << vnum[i] -> imag() << endl;
  vector<st *> cp(2);
  cp[0] = &a[0];
  cp[1] = &a[1];
  for (int i = 0; i < 2; i++)
    cout << "a = " << cp[i] -> a << ", b = " << cp[i] -> b << endl;
}