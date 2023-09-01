#include <iostream>
#include <vector>
#include <algorithm>
#include <iterator>
using namespace std;
int main(){
  char st[11] = "abcdefghij";
  vector<char> a(st, st + 10);
  vector<char>::iterator p;
  p = a.begin();
  a.insert(p + 3, 'X');
  copy(a.begin(), a.end(), ostream_iterator<char>(cout, " "));
  cout << endl;
  p = a.begin();
  a.insert(p, 3, 'A');
  copy(a.begin(), a.end(), ostream_iterator<char>(cout, " "));
  cout << endl;
  a.erase(p + 8);
  copy(a.begin(), a.end(), ostream_iterator<char>(cout, " "));
  cout << endl;
}