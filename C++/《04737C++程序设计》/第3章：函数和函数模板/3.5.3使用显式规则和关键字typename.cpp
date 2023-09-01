#include <iostream>
using namespace std;
template <typename T, typename U>
T min(T m1, U m2){
return(m1 < m2)? m1:m2;
}
int main() {
cout << ::min(8.5, 6) << endl;
cout << ::min(1, 2) << endl;
}