#include <iostream>
using namespace std;
class Base{
  private:
    double x, y;
    const double p;
  public:
    Base(double m, double n, double d):p(d){  // 常量p必须使用初始化列表获得初值
      x = m;
      y = n;
    }
    void Show();
    void Show() const;
};
void Base::Show(){
  cout << x << ", " << y << " p = " << p << endl;
}
void Base::Show() const{
  cout << x << ", " << y << " const p = " << p << endl;
}
int main(){
  Base a(8.9, 2.5, 3.1416);
  const Base b(2.5, 8.9, 3.14);
  b.Show(); // 调用void Show() const;
  a.Show(); // 调用void Show();
}