#include <iostream>
#include <iomanip>
using namespace std;
const double PI = 3.141592;
int main(){
  cout << PI << endl
       << setprecision(0) << PI << endl
       << setprecision(1) << PI << endl
       << setprecision(2) << PI << endl
       << setprecision(3) << PI << endl
       << setprecision(7) << PI << endl;
  int b = 100;
  cout << "Dec: " << dec << b << endl   // 转换为十进制
       << "Hex: " << hex << b << endl   // 转换为十六进制
       << "Oct: " << oct << b << endl;  // 转换为八进制
  cout << b << endl
       << 100 << endl
       << "Input b = ";
  cin >> b;
  cout << b << endl;
  cout << dec << setiosflags( ios_base::showpos ) << b << endl; // 为正数添加+号
  cout << "Input b = ";
  cin >> b;
  cout << b << endl;
  cout << resetiosflags( ios_base::showpos ); // 重置flags
  cout << b << endl;
}