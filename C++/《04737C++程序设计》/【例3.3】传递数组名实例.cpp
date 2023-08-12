#include <iostream>
using namespace std;
void swap(int[ ]);  // 数组形参使用“类型[ ]”的形式
int main(){
  int a[ ] = {3, 8};
  cout << "a[0] = " << a[0] << " a[1] = " << a[1] << endl;
  cout << "&a[0] = " << &a[0] << " &a[1] = " << &a[1] << endl;
  cout << "a = " << a << " a + 1 = " << a + 1 << endl;
  cout << "&a = " << &a << " &a + 1 = " << &a + 1 << endl;
  swap(a);
  cout << "new_a[0] = " << a[0] << " new_a[1] = " << a[1] << endl;
  cout << "&new_a[0] = " << &a[0] << " &new_a[1] = " << &a[1] << endl;
  cout << "new_a = " << a << " new_a + 1 = " << a + 1 << endl;
  cout << "&new_a = " << &a << " &new_a + 1 = " << &a + 1 << endl;
}
void swap(int a[ ]){  // 数组名a，也就是指针名作为函数参数
  int temp = a[0];
  a[0] = a[1];
  a[1] = temp;
  cout << "swap_a[0] = " << a[0] << " swap_a[1] = " << a[1] << endl;
  cout << "&swap_a[0] = " << &a[0] << " &swap_a[1] = " << &a[1] << endl;
  cout << "swap_a = " << a << " swap_a + 1 = " << a + 1 << endl;
  cout << "&swap_a = " << &a << " &swap_a + 1 = " << &a + 1 << endl;
}