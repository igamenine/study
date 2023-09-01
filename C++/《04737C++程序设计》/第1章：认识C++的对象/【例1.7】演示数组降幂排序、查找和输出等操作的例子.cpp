#include <iostream>
#include <algorithm>
#include <functional>
#include <iterator>
using namespace std;
int main(){
  double a[ ] = {1.1, 4.4, 3.3, 2.2}, b;
  sort(a, a + 4);
  copy(a, a + 4, ostream_iterator<double>(cout, " "));
  cout << endl;
  sort(a, a + 4, greater<double>());
  copy(a, a + 4, ostream_iterator<double>(cout, " "));
  cout << endl;
  b = 4.4;
  double * x = find(a, a + 4, b);
  if( x == a + 4)
    cout << "没有值为" << b << "的数组元素";
  else
    cout << "有值为" << * x << "的数组元素";
  cout << endl;
  b = 8;
  x = find(a, a + 4, 8);
  if( x == a + 4)
    cout << "没有值为" << b << "的数组元素";
  else
    cout << "有值为" << * x << "的数组元素";
  cout << endl;
  }