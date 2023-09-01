#include <iostream>
using namespace std;
class test{
private:
    int i;
    float f;
    char ch;
public:
    test(int a = 0, float b = 0, char c = '\0'){
        i = a;
        f = b;
        ch = c;
    }
    friend ostream& operator<<(ostream&, const test&);
    friend istream& operator>>(istream&, test&);
};

ostream& operator<<(ostream& output, const test& obj){
    output << obj.i << ", ";
    output << obj.f << ", ";
    output << obj.ch << endl;
    return output;
}

istream& operator>>(istream& input, test& obj){
    cout << "Enter i f ch: ";
    input >> obj.i >> obj.f >> obj.ch;
    // input.ignore();    // 处理换行符，如果不处理运算符则需要将所有对象的值填入同一行
    return input;
}

int main(){
  test A(45, 8.5, 'W');
  operator<<(cout, A);
  test B, C;
  // cout << "Enter i f ch: ";  // 如果不需要处理换行符则是使用这个提示字符串，注释其他无关字符串
  cout << "B ";
  operator>>(cin, B); // 也可以写成 cin >> B;
  operator<<(cout, B);  // 也可以写成 cout << B;
  cout << "C ";
  operator>>(cin, C); // 也可以写成 cin >> C;
  operator<<(cout, C);  // 也可以写成 cout << C;
}