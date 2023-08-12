#include <iostream>
#include <string>
#include <algorithm>
#include <functional>
#include <iterator>
using namespace std;
int main(){
  string str = "We are here!";
  cout << "str = " << str << endl;
  cout << "str[7] = " << str[7] << endl;
  cout << "str.at(7) = " << str.at(7) << endl;
  cout << "str[str.find('h')] = " << str[str.find('h')] << endl;
  cout << "str.substr(7, 1) = " << str.substr(7, 1) << endl;
  cout << "copy(str.begin() + 7, str.begin() + 8, ostream_iterator<char>(cout)) = ";
  copy(str.begin() + 7, str.begin() + 8, ostream_iterator<char>(cout));
  cout << endl;
  cout << "* find(str.begin(), str.end(), 'h') = " 
       << * find(str.begin(), str.end(), 'h') << endl;
  for (string::iterator i = str.begin(); i != str.end(); i++){  // 使用迭代器遍历字符串中的所有字符，当遇到字符“h”时，将其输出到控制台
    if(* i == 'h'){
      cout << "* str_pos = " << * i << endl;
    }
  }
}