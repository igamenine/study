#include <iostream>
#include <algorithm>
#include <functional>
#include <vector>
#include <iterator>
using namespace std;
int main(){
  double a[] = {1.1, 4.4, 3.3, 2.2};
  vector<double> va(a, a + 4), vb(4); // 定义并初始化向量va
  cout << "va = ";
  copy(va.begin(), va.end(), ostream_iterator<double>(cout, " "));  // 正向输出va
  cout << endl;
  cout << "reverse_va = vb = ";
  reverse_copy(va.begin(), va.end(), ostream_iterator<double>(cout, " "));  // 逆向输出va
  cout << endl;
  reverse_copy(va.begin(), va.end(), vb.begin()); // va逆向复制给vb
  copy(vb.begin(), vb.end(), ostream_iterator<double>(cout, " "));  // 正向输出vb
  cout << endl;
  sort(va.begin(), va.end()); // va升幂排序
  sort(vb.begin(), vb.end(), greater<double>());  // vb降幂排序
  copy(va.begin(), va.end(),  ostream_iterator<double>(cout, " ")); // 正向输出va
  cout << endl;
  copy(vb.begin(), vb.end(),  ostream_iterator<double>(cout, " ")); // 正向输出vb
  cout << endl;
  va.swap(vb);  // 交换va和vb的内容
  copy(va.begin(), va.end(), ostream_iterator<double>(cout, " "));  // 正向输出va
  cout << endl;
  copy(vb.begin(), vb.end(), ostream_iterator<double>(cout, " "));  // 正向输出vb
  cout << endl;
}