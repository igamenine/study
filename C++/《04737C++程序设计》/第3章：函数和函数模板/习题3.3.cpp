#include <iostream>
#include <cmath>  // 使用std::pow函数
using namespace std;

double mi(double r, int n){
  double m = r;
  for (int i = 1; i < n; i++){
    m = m * r;
  }
  return m;
}

double power(double r, int n){
  return pow(r, n);
}

int main(){
  double r;
  int n;
  cout << "请输入实数r和整数n：";
  cin >> r >> n;
  cout << "r的n次幂等于 " << mi(r, n) << endl;
  cout << "pow(r, n) = " << power(r, n) << endl;
}