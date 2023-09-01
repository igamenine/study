#include <iostream>
#include <cstdio>
#include <limits>
using namespace std;

int main(){
  cout << "(1) ";
  cout << 5.0 << " " << 3.4e+2 << endl;
  cout << "(2) ";
  int i1;
  double d1;
  cin >> i1 >> d1;
  cout << i1 << " " << d1 << endl;
  cout << "(3) ";
  char c1, c2, c3;
  cin >> c1 >> c2 >> c3;
  cout << c1 << " " << c2 << " " << c3 << endl;
  cout << "(4) ";
  string s1, s2;
  cin >> s1 >> s2;
  cout << s1 << ", " << s2 << endl;
  cout << "(5) ";
  char c4[5];
  cin >> c4;
  c4[5] = '\0';
  cout << c4 << ", ";
  for (int i = 0; i < 5; i++){
    cout << "c4[" << i << "] = " << c4[i];
    if(i < 4)
      cout << ", ";
  }
  cout << endl;
  cout << "(6) ";
  char * p1 = new char[5];
  for(int i = 0; i < 4; i++)
    cin >> * (p1 + i);
  p1[4] = '\0';
  cout << p1 << endl;
  delete[] p1;
  cout << "(7) ";
  char c5[3], c6, c7[3], c8, ctemp;
  cin >> c5 >> c6;
  c5[3] = '\0';
  cout << c5 << ", " << c6 << endl;
  cin >> c7 >> c8 >> ctemp; // ctemp用来规避给(8)带来的影响
  c7[3] = '\0';
  cout << c7 << ", " << c8 << endl;
  cout << "(8) ";
  bool b1;
  for (int i = 0; i < 2; i++){
  cin >> b1;
  if(cin.fail()){ // 判断是否读取失败
    cin.clear();  // 清空错误状态位
    cin.ignore(numeric_limits<streamsize>::max(), '\n');  // 忽略多余字符
    i--;
    cout << "输出了非bool值，请重新输入" << endl;
    continue;
  }
  cout << b1 << endl;    
  }
}