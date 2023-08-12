#include <iostream>
using namespace std;

int strlen(char[]);
void revers(char[], int, int);

int main() {
    char s[] = "hello world!";
    cout << "初始化的s是" << s << endl;
    cout << "s的长度是" << strlen(s) << endl; // 输出字符串长度
    revers(s, 0, strlen(s) - 1); // 反转字符串
    cout << "反转后的s是" << s << endl; // 输出反转后的字符串
    return 0;
}

// 求字符串长度的函数
int strlen(char s[]) {
    int len = 0;
    while (s[len] != '\0') {
        len++;
    }
    return len;
}

// 递归反转字符串的函数
void revers(char s[], int start, int end) {
    if (start >= end) { // 边界条件
      cout << "start = " << start << " " << "end = " << end << endl;
      cout << "s[start] = " << s[start] << " " << "s[end] = " << s[end] << endl;
      return; // return是必须的，这是告诉函数结束执行，否则会形成循环递归
    }
    char temp = s[start]; // 记录起始位置对应的字符
    s[start] = s[end];
    s[end] = temp;
    revers(s, start + 1, end - 1); // 递归调用，更新字符串边界
}