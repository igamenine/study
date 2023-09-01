#include <iostream>
using namespace std;
class number{
    int num;
  public:
    number(int i){
      num = i;
    }
    friend int operator++(number&); // 前缀：++n
    friend int operator++(number&, int);  // 后缀：n++
    void print(){
      cout << "num = " << num << endl;
    }
};
int operator++(number& a){
  a.num++;
  return a.num;
}
int operator++(number& a, int){ // 照样不用给出int类型的形参名
  int i = a.num++;  // 等同于int i = a.num; a.num++;
  return i;
}
int main(){
  number n(10);
  int i = ++n;  // 等同于int i = n.operator++();
  cout << "i = " << i << endl;
  n.print();
  i = n++;  // 等同于i = n.operator++(0);
  cout << "i = " << i << endl;
  n.print();
}