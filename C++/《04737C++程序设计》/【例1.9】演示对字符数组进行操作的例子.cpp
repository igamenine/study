#include <iostream>
#include <algorithm>
#include <functional>
#include <iterator>
using namespace std;
int main(){
  char a[ ] = "wearehere!", b[11];
  cout << "a = " << a << endl;
  reverse(a, a + 10);
  cout << "reverse_a = ";
  copy(a, a + 10, ostream_iterator<char>(cout));
  cout << endl;
  copy(a, a + 11, b);
  sort(a, a + 10);
  cout << "a = b = " << b << endl;
  cout << "sort_a = " << a << endl;
  reverse_copy(a, a + 10, b);
  cout << "reverse_a = b = " << b << endl;
  reverse(b + 2, b + 8);
  cout << "reverse [ b[2], b[8] ) = ";
  copy(b + 2, b + 8, ostream_iterator<char>(cout));
  cout << endl;
  sort(a, a + 10, greater<char>());
  cout << "sort_greater_a = " << a << endl;
  cout << "find 'e' on a = " << ( * find(a, a + 10, 'e') == 'e' ) << " " 
       << "find 'O' on a = " << ( * find(a, a + 10, 'O') == 'O') << endl;
  cout << sizeof(a) << endl;
}