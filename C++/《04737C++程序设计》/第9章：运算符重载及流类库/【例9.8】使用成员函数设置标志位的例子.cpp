#include <iostream>
using namespace std;
const double PI = 3.141592;
int main(){
  int a = 15;
  // 演示使用setf和unsetf
  cout.setf(ios_base::showpoint);
  cout << 123.0 << " ";
  cout.unsetf(ios_base::showpoint);
  cout << 123.0 << endl;
  cout.setf(ios_base::showbase);
  cout.setf(ios_base::hex, ios_base::basefield);
  // 比较哪种方便
  cout << a << " " << uppercase << hex << a << " " << nouppercase << hex << a << " " << noshowbase << a << dec << " " << a << endl;
  float c = 23.56F, d = -101.22F;
  cout.width(20);
  cout.setf(ios_base::scientific | ios_base::right | ios_base::showpos, ios_base::floatfield);
  cout << c << "\t" << d << "\t";
  // 演示使用flags
  cout << cout.flags() << " " << 123.0 << " ";
  cout.flags(ios_base::boolalpha | ios_base::showpos);  // VC6.0编译可用cout.flags(513);
  cout << 123.0 << endl;
  cout.setf(ios_base::scientific);
  cout << 123.0 << endl;
  cout.width(8);
  cout << cout.fill('*') << 123 << endl;
}