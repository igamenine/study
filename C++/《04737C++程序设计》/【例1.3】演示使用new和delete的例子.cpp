#include <iostream>
using namespace std;
int main(){
  double * p;                     // 声明double型指针
  p = new double[3];              // 分配3个double类型数据的存储空间
  cout << * p << " " << p << endl;// 输出指针p的值与初始存储空间
  for (int i = 0; i < 3; i++)     // 定义对象i的初值为0
    cin >> * (p + i);             // 将输入数据存入指定地址
  for ( int i = 0; i < 3; i++)
    cout << p + i << ": " << * (p + i) << " "; // 将存储地址与内容输出
  delete p;                       // 删除指针
  cout << endl;
}