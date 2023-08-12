#include <iostream>
#include <algorithm>
#include <functional>
#include <iterator>
using namespace std;

template <typename T>
T sort(T t[]){
  sort(t, t + 3);
  cout << "按最小值排序：";
  copy(t, t + 3, ostream_iterator<T>(cout, " "));
  cout << endl;
  sort(t, t + 3, greater<T>());
  cout << "按最大值排序：";
  copy(t, t + 3, ostream_iterator<T>(cout, " "));
  cout << endl;
  return 0;
}

int main(){
  double t[3];
  cout << "请输入3个数值，以空格分隔：";
  for (int i = 0; i < 3; i++){
    cin >> t[i];
  }
  sort(t);
}
