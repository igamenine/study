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
template <typename T>
T sum(T t1[], T t2[]){
  T sum(0);
  for (int i = 0; i < 3; i++){
    sum = sum + t1[i] + t2[i];
  }
  return sum;
}

int main(){
  double t1[3], t2[3];
  cout << "请为t1输入3个数值，以空格分隔：";
  for (int i = 0; i < 3; i++){
    cin >> t1[i];
  }
  cout << "请为t2输入3个数值，以空格分隔：";
  for (int i = 0; i < 3; i++){
    cin >> t2[i];
  }
  cout << "t1和t2数组元素总和为" << sum(t1, t2) << endl;
}