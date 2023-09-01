#include <iostream>
using namespace std;
template <class T>
class Max4{
    T a, b, c, d;
    T Max(T a, T b){
      return (a > b)? a:b;
    }
  public:
    Max4(T, T, T, T);
    T Max(void);
};
template <class T>  // 定义成员函数必须再次声明为模板
Max4<T>::Max4(T x1, T x2, T x3, T x4):a(x1), b(x2), c(x3), d(x4){}
template <class T>  // 定义成员函数必须再次声明为模板
T Max4<T>::Max(void){
  return Max(Max(a, b), Max(c, d));
}
int main(){
  Max4<char> C('W', 'w', 'a', 'A'); // 比较字符
  Max4<int> A(-25, -67, -66, -256); // 比较整数
  Max4<double> B(1.25, 4.3, -8.6, 3.5); // 比较双精度实数
  cout << C.Max() << " " << A.Max() << " " << B.Max() << endl;
}