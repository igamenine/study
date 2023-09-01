#include <iostream>
using namespace std;
template <class T, int size = 4>
class Sum{
    T m[size];  // 数据成员
  public:
    Sum(T a, T b, T c, T d){
      m[0] = a;
      m[1] = b;
      m[2] = c;
      m[3] = d;
    }
    T S(){
      return m[0] + m[1] + m[2] + m[3];
    }
};
int main(){
  Sum<int, 4> num1(-23, 5, 8, -2);
  Sum<float, 4> f1(3.5f, -8.5f, 8.8f, 9.7f);
  Sum<double, 4> d1(355.4, 253.8, 456.7, -67.8);
  Sum<char, 4> c1('W', -2, -1, -1); // 'W' - 4 = 'S'
  cout << num1.S() << ", " << f1.S() << ", " << d1.S() << ", " << c1.S() << endl;
}