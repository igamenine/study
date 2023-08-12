#include <iostream>
using namespace std;
int isnumber(char);
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
int isnumber(char c){
  return (c >= '0' && c <= '9')? 1:0;
}