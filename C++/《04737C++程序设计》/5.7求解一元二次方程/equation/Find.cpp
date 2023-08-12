#include "equation.h"
#include <cstdio>
void Read(float &, float &, float &); // 参数使用对象引用方式，这样就不需要在函数中声明变量了
int main(){
  float a, b, c;
  cout << "这是一个求方程ax2+bx+c=0的根的程序" << endl;
  for(;;){ //for(;;)代表递归循环求解，注意设置停止条件
    Read(a, b, c);  // 准备系数
    if (a == 0)  // 递归循环停止条件为a == 0
      return 0; // 根据输入系数a决定是否结束for循环
    FindRoot obj(a, b, c);
    obj.Find();
    obj.Display();
  }
}
void Read(float & a, float & b, float & c){
  cout << "输入方程系数a，为0则退出：";
  cin >> a;
  if (a == 0){
    getchar();  // 调用getchar函数消除回车的影响，头文件要包含<cstdio>
    return;
  }
  cout << "输入方程的系数b：";
  cin >> b;
  cout << "输入方程的系数c：";
  cin >> c;
}