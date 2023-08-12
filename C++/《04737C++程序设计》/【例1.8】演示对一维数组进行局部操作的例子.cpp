#include <iostream>
#include <algorithm>
#include <functional>
#include <iterator>
using namespace std;
int main(){
  double a[ ] = {1.1, 4.4, 3.3, 2.2}, b[8] = {8};
  cout << "a = ";
  copy(a, a + 4, ostream_iterator<double>(cout, " "));
  cout << endl;
  cout << "b = ";
  copy(b, b + 8, ostream_iterator<double>(cout, " "));
  cout << endl;
  cout << "[ a[2], a[4] ) = [3,5) = ";
  copy(a + 2, a + 4, ostream_iterator<double>(cout, " "));
  cout << endl;
  cout << "reverse[ a[1], a[4] ) = reverse[2,5) = ";
  reverse_copy(a + 1, a + 4, ostream_iterator<double>(cout, " "));
  cout << endl;
  cout << "将数组a复制到数组b的尾部" << endl;
  copy(a, a + 4, &b[4]);
  cout << "b = ";
  copy(b, b + 8, ostream_iterator<double>(cout, " "));
  cout << endl;
  cout << "对部分数组元素[ a[1], a[3] )升幂排序" << endl;
  sort(a + 1, a + 3);
  cout << "a = ";
  copy(a, a + 4, ostream_iterator<double>(cout, " "));
  cout << endl;
  cout << "对部分数组元素[ b[0], b[6] )降幂排序" << endl;
  sort(b, b + 6, greater<double>());
  cout << "b = ";
  copy(b, b + 8, ostream_iterator<double>(cout, " "));
  cout << endl;
}