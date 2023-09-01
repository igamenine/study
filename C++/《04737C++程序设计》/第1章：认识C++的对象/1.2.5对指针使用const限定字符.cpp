#include <iostream>
using namespace std;

int main(){
int x = 1;
int y = 2;
int * p = &x;
cout << "初始化内容" << endl;
cout << "x = " << x << ", y = " << y << ", * p = " << * p << ", p = " << p << endl;
x = y * 10;
cout << "将y * 10赋值给x" << endl;
cout << "x = " << x << ", y = " << y << ", * p = " << * p << ", p = " << p << endl;
p = &y;
cout << "将&y赋值给p" << endl;
cout << "x = " << x << ", y = " << y << ", * p = " << * p << ", p = " << p << endl;
const int * p1 = &x;
cout << "将&x赋值给指向常量的指针p1" << endl;
cout << "x = " << x << ", y = " << y << ", * p1 = " << * p1 << ", p1 = " << p1 << endl;
p1 = &y;
cout << "将&y赋值给p1" << endl;
cout << "x = " << x << ", y = " << y << ", * p1 = " << * p1 << ", p1 = " << p1 << endl;
//* p1 = x * 20; // 企图直接更改指向常量的指针的值，编译时就会报错，因为是非法操作：向只读位置‘* p1’赋值
//cout << "将x * 20赋值给p1" << endl;
//cout << "x = " << x << ", y = " << y << ", * p1 = " << * p1 << ", p1 = " << p1 << endl;
y = 3;
cout << "将" << y << "赋值给y" << endl;
cout << "x = " << x << ", y = " << y << ", * p1 = " << * p1 << ", p1 = " << p1 << endl;
cout << "展示各变量的内存地址" << endl;
cout << "&x = " << &x << ", &y = " << &y << ", p = " << p << ", p1 = " << p1 << endl;
cout << "展示各变量的值" << endl;
cout << "x = " << x << ", y = " << y << ", * p = " << * p << ", * p1 = " << * p1 << endl;
* p = 4;
cout << "更改* p的值" << endl;
cout << "* p = " << * p << ", p = " << p << ", y = " << y << ", &y = " << &y << endl;
int * const p2 = &x;
cout << "将&x赋值给常量指针p2" << endl;
cout << "* p2 = " << * p2 << ", p2 = " << p2 << ", &x = " << &x << ", x = " << x << endl;
//try {
//p2 = &y; // 企图更改常量指针的内存地址，编译时就会报错，因为是非法操作：向只读变量‘p2’赋值
//cout << "将&y赋值给p2" << endl;
//cout << "x = " << x << ", y = " << y << ", * p2 = " << * p2 << ", p2 = " << p2 << endl;
//} catch (const exception& e) {  // 捕获异常
//        cout << "捕获到了异常：" << e.what() << endl;
//}
* p2 = x * 100;
cout << "将x * 100赋值给p2" << endl;
cout << "* p2 = " << * p2 << ", p2 = " << p2 << ", x = " << x << ", &x = " << &x << endl;
const int * const p3 = &x;
cout << "将&x赋给指向常量的常量指针p3" << endl;
cout << "* p3 = " << * p3 << ", p3 = " << p3 << ", x = " << x << ", &x = " << &x << endl;
//* p3 = x * 30; // 企图直接更改指向常量的常量指针的值，编译时就会报错，因为是非法操作：向只读位置‘*(const int*)p3’赋值
//p3 = &y; // 企图直接更改指向常量的常量指针的值，编译时就会报错，因为是非法操作：向只读变量‘p3’赋值
}


/*
初始化内容
x = 1, y = 2, * p = 1, p = 0x7ffce26d9b0c
将y * 10赋值给x
x = 20, y = 2, * p = 20, p = 0x7ffce26d9b0c
将&y赋值给p
x = 20, y = 2, * p = 2, p = 0x7ffce26d9b08
将&x赋值给指向常量的指针p1
x = 20, y = 2, * p1 = 20, p1 = 0x7ffce26d9b0c
将&y赋值给p1
x = 20, y = 2, * p1 = 2, p1 = 0x7ffce26d9b08
将3赋值给y
x = 20, y = 3, * p1 = 3, p1 = 0x7ffce26d9b08
展示各变量的内存地址
&x = 0x7ffce26d9b0c, &y = 0x7ffce26d9b08, p = 0x7ffce26d9b08, p1 = 0x7ffce26d9b08
展示各变量的值
x = 20, y = 3, * p = 3, * p1 = 3
更改* p的值
* p = 4, p = 0x7ffce26d9b08, y = 4, &y = 0x7ffce26d9b08
将&x赋值给常量指针p2
* p2 = 20, p2 = 0x7ffce26d9b0c, &x = 0x7ffce26d9b0c, x = 20
将x * 100赋值给p2
* p2 = 2000, p2 = 0x7ffce26d9b0c, x = 2000, &x = 0x7ffce26d9b0c
将&x赋给指向常量的常量指针p3
* p3 = 2000, p3 = 0x7ffce26d9b0c, x = 2000, &x = 0x7ffce26d9b0c
*/