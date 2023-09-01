#include <iostream>
#include <string>
using namespace std;
string input(const int);  // 声明返回string类型的函数
int main(){
  int n;
  cout << "输入字符串数量: ";
  cin >> n; // 接收要处理的字符串数量
  string str = input(n);
  cout << "输入的字符串为: " << str << endl;
}
string input(const int n){
  string s1, s2;  // 建立两个string类的对象（均为空串）
  cout << "输入字符串，按空格分隔: ";
  for (int i = 0; i < n; i++){  // 接收n个字符串
    cin >> s1; s2 = s2 + s1 + " ";  // 将接收的字符串相加
  }
  return s2;  // 返回string对象
}