/* 功能：将结构对象的两个域值相加，乘以2再加50 */
#include <iostream>     // 包含头文件
using namespace std;      // 使用命名空间
int result( int , int );  // result函数的原型声明
const int k = 2;          // 定义常量
struct Point {            // 定义结构point
  int x, y;               // 定义结构成员x和y
};

int main(){               // 主程序
  int z(0), b(50);        // 初始化整数对象
  Point a;                // 定义结构对象
  cout << "输入两个整数（以空格区分）："; // 输出提示信息
  cin >> a.x >> a.y;      // 接受输入数值
  z = ( a.x + a.y ) * k;  // 计算结果：两个域值相加，乘以2
  z = result(z, b);       // 计算结果：上面的结果加50
  cout << "计算结果如下：" << endl; // 输出信息并换行
  cout << "( ( " << a.x << " + " << a.y << ") * " << k << " ) + " << b << " = " << z << endl; // 输出信息并换行
  return 0;               // 主函数main的返回值
}

//  *********************************
//  * 函数：result                  *
//  * 参数：整型对象a和b             *
//  * 返回值：整型对象               *
//  *********************************
int result( int a, int b )
{
  return a + b;           // 返回 a + b
}
