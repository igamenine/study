#include <iostream>
using namespace std;

int main(){
int x = 5;
int y = 1;
int * p = &x;
cout << "初始化内容" << endl;
cout << "x = " << x << ", * p = " << * p << ", p = " << p << endl;
x = y;
cout << "将y赋值给x" << endl;
cout << "x = " << x << ", * p = " << * p << ", p = " << p << endl;
p = &y;
cout << "将&y赋值给p" << endl;
cout << "x = " << x << ", * p = " << * p << ", p = " << p << endl;
}

// 运行结果
/*
初始化内容
x = 5, * p = 5, p = 0x7ffeca64b234
将y赋值给x
x = 1, * p = 1, p = 0x7ffeca64b234
将&y赋值给p
x = 1, * p = 1, p = 0x7ffeca64b230
*/
