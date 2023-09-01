#include <iostream>
using namespace std;
inline int isnumber(char);  // 可不写，事实上只要保证main调用的函数被提前声明过都不会报错
inline int isnumber(char c){
  return (c >= '0' && c <= '9')? 1:0;
}
int main(){
  char c;
  cout << "请输入一个字符: ";
  cin >> c;
  if(isnumber(c)){
    cout << "属于数字字符" << endl;
  }
  else{
    cout << "不属于数字字符" << endl;
  }
}