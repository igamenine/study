#include <iostream>
#include <vector>
using namespace std;
int main(){
  char st[11] = "abcdefghij";
  vector<char> a(st, st + 10);
  for (int j = 0; j < 10; j++)
    cout << a[j] << " ";
  cout << endl << a.capacity() << ", " << a.size() << endl;
  a.pop_back();
  a.push_back('W');
  a.push_back('P');
  for (int j = 0; j < a.size(); j++)
    cout << a[j] << " ";
  cout << endl << a.capacity() << ", " << a.size() << ", ";
  a.clear();
  cout << a.empty() << endl;
}