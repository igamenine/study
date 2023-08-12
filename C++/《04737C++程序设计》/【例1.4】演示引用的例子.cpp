#include <iostream>
using namespace std;

int main(){
  int x = 56;
  int& a = x;
  int& r =a;
  cout << "x = " << x << ", &x = " << &x << ", a = " << a << ", &a = " << &a << ", r = " << r << ", &r = " << &r << endl;
  r = 25;
  cout << "x = " << x << ", &x = " << &x << ", a = " << a << ", &a = " << &a << ", r = " << r << ", &r = " << &r << endl;  
}


