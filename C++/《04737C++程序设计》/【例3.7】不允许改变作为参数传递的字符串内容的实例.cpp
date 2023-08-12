#include <iostream>
#include <string>
using namespace std;
void change(const string &);
int main(){
  string str("Can you change it?");
  change(str);
  cout << str << endl;
}
void change(const string & s){
  string s2 = s + " No!";
  // s = s2; // 这样写会报错，不允许改变const参数
  cout << s2 << endl;
}