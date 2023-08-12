#include <iostream>
#include <string>
#include <algorithm>
#include <functional>
#include <iterator>
using namespace std;
int main(){
  string str1 = "wearehere!", str2(str1);
  cout << "str1 = " << str1 << endl;
  reverse(str1.begin(), str1.end());
  cout << "reverse_str1 = " << str1 << endl;
  copy(str1.begin(), str1.end(), str2.begin());
  sort(str1.begin(), str1.end());
  cout << "sort_str1 = " << str1 << endl;
  cout << "str2 = " << str2 << endl;
  reverse_copy(str1.begin(), str1.end(), str2.begin());
  cout << "str1 = str2 = " << str2 << endl;
  reverse(str2.begin() + 2, str2.begin() + 8);
  cout << "reverse(str2[2]~str2[7]) = ";
  copy(str2.begin() + 2, str2.begin() + 8, ostream_iterator<char>(cout));
  cout << endl;
  sort(str1.begin(), str1.end(), greater<char>());
  cout << "sort_greater_str1 = " << str1 << endl;
  str1.swap(str2);
  cout << "str1 = " << str1 << ", str2 = " << str2 << endl;
  cout << ( * find(str1.begin(), str1.end(), 'e') == 'e') << " " << ( * find(str1.begin(), str1.end(), 'O') == 'O') << endl;
}