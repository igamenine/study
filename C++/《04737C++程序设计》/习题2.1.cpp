#include <iostream>
#include <string>
using namespace std;
int main(){
  string str1 = "We are here!", str2 = "Where are you?", str3(str1);
  cout << "str1 = " << str1 << ", str2 = " << str2 << endl;
  cout << "使用+运算符连接: " << endl << str1 + str2 << endl;
  cout << "使用成员函数append连接: " << endl << str1.append(str2) << endl;
  str1 = str3;
  str1 += str2;
  cout << "使用+=运算符连接: " << endl << str1 << endl;
  str1 = str3;
  str1.resize(str1.length() + str2.length());
  copy(str2.begin(), str2.end(), str1.end() - str2.length());
  cout << "使用copy运算符连接: " << endl << str1 << endl;
}