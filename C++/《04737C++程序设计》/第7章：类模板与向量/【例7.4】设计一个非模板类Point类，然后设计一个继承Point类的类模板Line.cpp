  #include <iostream>
  using namespace std;
  class Point{
      int x, y;
    public:
      Point(int a, int b){
        x = a;
        y = b;
      }
      void display(){
        cout << x << ", " << y << endl;
      }
  };
template <typename T>
class Line:public Point{
    T x2, y2;
  public:
    Line(int a, int b, T c, T d):Point(a, b){
      x2 = c;
      y2 = d;
    }
    void display(){
      Point::display();
      cout << x2 << ", " << y2 << endl;
    }
};
int main(){
  Point a(3, 8);  // 对象a是整数坐标
  a.display();
  Line<int> ab(4, 5, 6, 7);
  ab.display();
  Line<double> ad(4, 5, 6.5, 7.8);  // 线段ad的一个坐标是整数，另一个是实数
  ad.display();
}