#include <iostream>
using namespace std;
char up(char ch){
  return(ch >= 'a' && ch <= 'z')? (ch - 'a' + 'A'):ch;
}
int main() {
    char c;
    cout << "输入字母: ";
    cin >> c;
    cout << "转换结果: " << up(c) << endl;
    return 0;
}