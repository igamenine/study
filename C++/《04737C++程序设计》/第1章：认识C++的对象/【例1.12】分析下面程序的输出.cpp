#include <iostream>
#include <iomanip>
using namespace std;
int main(){
  cout << setfill('*')  // 设置“*”为填充字符
       << setw(0) << 15 << endl
       << setw(1) << 15 << endl
       << setw(2) << 15 << endl
       << setw(3) << 15 << endl
       << setw(4) << 15 << endl
       << setw(15) << 15 << endl  // 补齐15位
       << setw(16) << setfill('*') << " " << endl // 带结束符空格填充15位“*”
       << setw(16) << setfill('*') << endl        // 如果没有结束符会全部填充为空格
       << setw(15) << setfill('*') << "" << endl; // 带结束符空字符串就不需要+1
  cout << setiosflags(ios_base::right)  // 填充从右至左
       << setw(5) << 1
       << setw(5) << 2
       << setw(5) << 3 << endl;
  cout << resetiosflags(ios_base::right);
  cout << setiosflags(ios_base::left) // 填充从左至右
       << setw(5) << 1
       << setw(5) << 2
       << setw(5) << 3 << endl;
}