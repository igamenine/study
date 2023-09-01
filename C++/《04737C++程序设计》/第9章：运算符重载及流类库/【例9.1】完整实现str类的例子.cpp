#include <iostream>
#include <string>
#include <cstring>  // strcpy() strlen()
using namespace std;

class str {
private:
    char* st;

public:
    str(const char* s);            // 使用字符指针的构造函数
    str(const str& s);            // 使用对象引用的构造函数
    str& operator=(const str& s); // 重载使用对象引用的赋值运算符
    str& operator=(const char* s); // 重载使用指针的赋值运算符
    void print(){                 // 输出字符串
        cout << st << " " << &st << endl;
    }
    ~str(){
        delete[] st;
    }
};

str::str(const char* s){
    st = new char[strlen(s) + 1]; // 为st申请内存
    strcpy(st, s);                // 将字符串s复制到内存空间st
}

str::str(const str& s){
    st = new char[strlen(s.st) + 1];
    strcpy(st, s.st);
}

str& str::operator=(const str& s){
    if (this == &s)
        return *this;
    delete[] st;
    st = new char[strlen(s.st) + 1];
    strcpy(st, s.st);
    return *this;
}

str& str::operator=(const char* s){
    if(strlen(s) == 0){ // 避免内存泄漏
        delete[] st;
        st = NULL;
        return *this;
    }
    delete[] st;  // 是字符串直接赋值，先释放内存空间
    st = new char[strlen(s) + 1];
    strcpy(st, s);
    return *this;
}

// 下面是测试程序
int main(){
    str s1("We"), s2("They"), s3(s1); // 调用构造函数和复制构造函数
    s1.print();
    s2.print();
    s3.print();
    s2 = s1 = s3; // 调用赋值操作符
    s3 = "Go home!";  // 调用字符串赋值操作符
    s3 = s3;  // 调用赋值操作符但不进行赋值操作
    s1.print();
    s2.print();
    s3.print();
}