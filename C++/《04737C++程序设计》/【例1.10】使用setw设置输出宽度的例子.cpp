#include <iostream>
#include <iomanip>
using namespace std;
int main(){
  int a = 29, b = 1001;
  cout << a << setw(6) << b << endl;
  cout << setw(6) << a << b << endl;
}