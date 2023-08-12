#include <iostream>
#include <string>
using namespace std;
void swap(string *, string *);  // 使用string类的指针作为函数参数
int main(){
  string str1("现在"), str2("过去");
  cout << "str1 = " << str1 << ", str2 = " << str2 << endl;
  cout << "&str1 = " << &str1 << " &str2 = " <<&str2 << endl;
  swap(&str1, &str2); // 使用传地址值方式传递str1和str2的地址值
  cout << "new_str1 = " << str1 << ", new_str2 = " << str2 << endl;
}
void swap(string * s1, string * s2){
  string temp = * s1;
  * s1 = * s2;
  * s2 = temp;
  cout << "swap_str1 = " << * s1 << ", swap_str2 = " << * s2 << endl;
  cout << "s1 = " << s1 << " s2 = " << s2 << endl;
  cout << "&s1 = " << &s1 << " &s2 = " << &s2 << endl;  // 指针地址值本身开辟出来存储的地址
  cout << "& * s1 = " << & * s1  << " & * s2 = " << & * s2 << endl;
  cout << "* & s1 = " << * & s1 << " * & s2 = " << * & s2 << endl;
}