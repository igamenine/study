#include <iostream>
#include <string>
using namespace std;
int main(){
  cout << "Enter the date in American format: ";
  string Date;
  getline(cin, Date, '\n'); // 测试数据格式: May 28, 2002
  int i = Date.find(" "); // 查找月份，通过May与28之间空格的位置确定
  cout << "空格位置i = " << i << endl;
  string Month = Date.substr(0, i); // 从0开始截取i个字符来截取月份
  int k = Date.find(","); // 查找日期，通过28与2002之间逗号的位置确定
  cout << "逗号位置k = " << k << endl;
  string Day = Date.substr(i + 1, k - i - 1); // 从i + 1开始截取k - i - 1个字符来截取日期
  string Year = Date.substr(k + 2, 4);  // 从k + 2开始截取4个字符来截取年份
  string NewDate = Day + " " + Month + " " + Year;  // 拼接字符串，以空格分隔
  cout << "Original date: " << Date << endl;
  cout << "Converted date: " << NewDate << endl;
}