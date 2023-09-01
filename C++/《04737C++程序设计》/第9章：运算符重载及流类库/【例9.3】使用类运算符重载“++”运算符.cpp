#include <iostream>
using namespace std;
class number{
    int num;
  public:
    number(int i){
      num = i;
    }
    int operator++(); // 前缀：++n
    int operator++(int);  // 后缀：n++
    void print(){
      cout << "num = " << num << endl;
    }
};
int number::operator++(){
  num++;
  return num;
}
int number::operator++(int){  // 不用给出形参名
  int i = num;
  num++;
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