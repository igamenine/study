#include <iostream>
#include <algorithm>
#include <functional>
#include <vector>
#include <iterator>
using namespace std;
int main(){
  vector<char> a(10), b(10);  // 产生向量a和b，元素内容均为0
  cout << a.empty() << ", " << sizeof(a) << ", ";
  for (char i = 'a', j = 0; j < 10; j++)
    a[j] = i + j;
  cout << a.max_size() << ", " << a.capacity() << ", " << a.size() << endl;
  for (int j = 0; j < 10; j++)
    cout << a[j] << " ";
  cout << endl;
  copy(a.begin(), a.end(), b.begin());
  copy(a.begin(), a.end(), ostream_iterator<char>(cout, " "));
  cout << endl;
  reverse_copy(a.begin(), a.end(), ostream_iterator<char>(cout, " "));
  cout << endl << a.front() << ", " << a.back() << ", " << a.operator[](5) << endl;
  sort(b.begin(), b.end(), greater<char>());
  copy(b.begin(), b.end(), ostream_iterator<char>(cout, " "));
  cout << endl;  
}