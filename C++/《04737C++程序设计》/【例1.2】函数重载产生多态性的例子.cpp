#include <iostream>
using namespace std;
int max(int, int);
int max(int, int, int);

int main(){
  cout << max(35, 25) << ", " << max(25, 39, 35) << endl;
  }
int max(int m1, int m2){
  return(m1 > m2)? m1:m2;
  }
int max(int m1, int m2, int m3){
  int t= max(m1, m2);
  return max(t, m3);
  }


