#include <iostream>
#include <algorithm>
#include <functional>
#include <iterator>
using namespace std;

template <typename T>
T sum(T t[]){
  T sum(0);
  for (int i = 0; i < 3; i++){
    sum = sum + t[i];
  }
  return sum;
}

int main(){
  double t[3];
  cout << "请输入3个数值，以空格分隔：";
  for (int i = 0; i < 3; i++){
    cin >> t[i];
  }
  cout << "数组元素总和为" << sum(t) << endl;
}