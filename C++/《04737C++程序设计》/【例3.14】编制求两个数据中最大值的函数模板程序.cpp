#include <iostream>
using namespace std;
template <class T>
T imax(T m1, T m2){
  return(m1 > m2)? m1:m2;
}
template <class T>
T max(T m1, T m2){
  return(m1 > m2)? m1:m2;
}
int main(){
  cout << imax(2, 5) << "\t" << imax(2.0, 5.) << "\t" << imax('w', 'a') << "\t" << imax("ABC", "ABD") << endl;
  // cout << max(2, 5) << "\t" << max(2.0, 5.) << "\t" << max('w', 'a') << "\t" << max("ABC", "ABD") << endl;
  cout << ::max(2, 5) << "\t" << ::max(2.0, 5.) << "\t" << ::max('w', 'a') << "\t" << ::max("ABC", "ABD") << endl;
}