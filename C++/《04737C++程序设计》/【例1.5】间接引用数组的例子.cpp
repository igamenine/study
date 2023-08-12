#include <iostream>
using namespace std;
typedef double array[10];
int main(){
  array a = {12, 34, 56, 78, 90, 98, 76, 85, 64, 43};
  array &b = a;
  cout << "a: "; 
  for (int i = 0; i < 10; i++)
    cout << a[i] << " ";        // 输出数组a
  cout << endl;
  a[2] = 100;                   // 修改数组a数值
  cout << "b: ";
  for (int i = 0; i < 10; i++)  // 数组b与数组a同步变化
    cout << b[i] << " ";        // 输出数组b
  cout << endl;
}