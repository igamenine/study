#include <iostream>
#include <string>
using namespace std;
void swap(string &, string &);  // 使用string类的引用对象作为参数
int main(){
  string str1("现在"), str2("过去");
  cout << "str1 = " << str1 << " str2 = " << str2 << endl;
  cout << "&str1 = " << &str1 << " &str2 = " <<&str2 << endl;
  swap(str1, str2);
  cout << "new_str1 = " << str1 << " new_str2 = " << str2 << endl;
}
void swap(string &s1, string &s2){
  string temp = s1;
  s1 = s2;
  s2 = temp;
  cout << "swap_str1 = " << s1 << " swap_str2 = " << s2 << endl;
  cout << "&s1 = " << &s1 << " &s2 = " << &s2 << endl;
}