#include <iostream>
#include <algorithm>
#include <iterator>
using namespace std;
int main(){
  double a[ ] = {1.1, 4.4, 3.3, 2.2},  b[4];
  cout << "a: ";
  copy(a, a + 4, ostream_iterator<double>(cout, " "));  // 正向输出数组a，以空格隔开
  cout << endl;
  cout << "reverse_a: ";
  reverse_copy(a, a + 4, ostream_iterator<double>(cout, " "));  // 逆向输出数组a，以空格隔开
  cout << endl;
  copy(a, a + 4, b);                                            // 原样复制到数组b
  cout << "b: ";
  copy(b, b + 4, ostream_iterator<double>(cout, " "));  // 正向输出到数组b，以空格隔开
  cout << endl;
  sort(a, a + 4); // 对数组a进行升幂排序
  cout << "sort_a: ";
  copy(a, a + 4, ostream_iterator<double>(cout, " "));  // 输出排序后的数组a
  cout << endl;
  reverse_copy(a, a + 4, b);  // 将a的内容逆向复制给数组b
  cout << "sort_reverse_a: ";
  copy(b, b + 4, ostream_iterator<double>(cout, " "));  // 输出数组b
  cout << endl;
}