#include <iostream>
#include <algorithm>
#include <functional>
#include <iterator>
using namespace std;
int main(){
  double a[ ] = {1.1, 4.4, 3.3, 2.2}, b;
  char c[ ] = "wearehere!";
  char * z = find(c, c + 10, 'z');
  cout << "z = " << z << ", c + 10 = " << c + 10 << endl;
  cout << "* z = " << * z << ", * (c + 10) = " << * (c + 10) << endl;
  if( z == c + 10 )
    cout << "没有值为" << 'z' << "的数组元素";
  else
    cout << "有值为" << * z << "的数组元素";
  cout << endl;
  double * y = find(a, a + 4, 11);
  cout << "y = " << y << ", a + 4 = " << a + 4 << endl;
  cout << "* y = " << * y << ", * (a + 4) = " << * (a + 4) << endl;
  if( y == a + 4 )
    cout << "没有值为" << 11 << "的数组元素";
  else
    cout << "有值为" << * y << "的数组元素";
  cout << endl;
  b = 1;
  double * x = find(a, a + 4, b);
  cout << "x = " << x << ", a + 4 = " << a + 4 << endl;
  cout << "* x = " << * x << ", * (a + 4) = " << * (a + 4) << endl;
  if( x == a + 4 )
    cout << "没有值为" << b << "的数组元素";
  else
    cout << "有值为" << * x << "的数组元素";
  cout << endl;
  }

/*
执行结果：
z = , c + 10 =
* z = , * (c + 10) =
没有值为z的数组元素
y = 0x7ffc25bd1e40, a + 4 = 0x7ffc25bd1e40
* y = 1.14198e+243, * (a + 4) = 1.14198e+243
没有值为11的数组元素
x = 0x7ffc25bd1e40, a + 4 = 0x7ffc25bd1e40
* x = 1.14198e+243, * (a + 4) = 1.14198e+243
没有值为1的数组元素
*/
