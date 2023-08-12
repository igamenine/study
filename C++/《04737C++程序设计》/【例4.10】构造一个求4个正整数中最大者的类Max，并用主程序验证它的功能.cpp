class Max{
  private:
    int a, b, c, d;
    int Maxi(int, int); // 只允许类内部的成员函数调用
  public:
    void Set(int, int, int, int); // 设置对象初值
    int Maxi(); // 求最大值
}A[3];  // 声明类的对象数组，定义结束
int Max::Maxi(int x, int y){
  return (x > y)? x:y;
}
void Max::Set(int x1, int x2, int x3 = 0, int x4 = 0){
  a = x1;
  b = x2;
  c = x3;
  d = x4;
}
int Max::Maxi(){
  int x = Maxi(a, b);
  int y = Maxi(c, d);
  return Maxi(x, y);
}
#include <iostream> // 包含文件等信息不是第一行也可以
using namespace std;
int main(){
  A[0].Set(12, 45, 76, 89);
  A[1].Set(12, 45, 76);
  A[2].Set(12, 45);
  for (int i = 0; i < 3; i++){
    cout << A[i].Maxi() << " ";
  }
  cout << endl;
}