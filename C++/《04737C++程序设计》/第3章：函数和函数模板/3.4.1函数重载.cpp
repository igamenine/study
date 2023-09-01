#include <iostream>
using namespace std;

string cz(int p){
  return "cz1";
}
string cz(int & p){
  return "cz2";
}
int main(){
  int p1 = 1;
  int & p2 = p1;
  cout << cz(p1) << endl;
  cout << cz(p2) << endl;
}