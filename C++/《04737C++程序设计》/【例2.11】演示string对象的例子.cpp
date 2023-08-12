#include <iostream>
#include <string>
#include <algorithm>
#include <iterator>
using namespace std;
int main(){
  string str1 = "we are here!", str2 = str1, str3 = "swap";
  cout << "str1 = " << str1 << endl;
  cout << "str3 = " << str3 << endl;
  reverse(&str1[0], &str1[0] + 12);
  cout << "reverse_str1 = " << str1 << endl;
  copy(&str1[0], &str1[0] + 12, &str2[0]);
  cout << "str2 = " << str2 << endl;
  reverse_copy(&str2[0], &str2[0] + 12, ostream_iterator<char>(cout));
  cout << endl;
  str1.swap(str3);  // 交换str1和str3的值
  cout << "swap_str1 = " << str1 << endl;
  cout << "swap_str3 = " << str3 << endl;
}