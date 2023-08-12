#include <iostream>
using namespace std;

float *input(int &);

int main() {
    int num;
    float *data;
    data = input(num);
    if (data) {
        for (int i = 0; i < num; i++) {
            cout << data[i] << " ";
        }
        delete[] data; // 使用 delete[] 释放内存
    }
    cout << endl;
    return 0;
}

float *input(int &n) {
    cout << "请输入数组个数: ";
    cin >> n;
    if (n <= 0) {
        cout << "数组个数不合法" << endl; // 输出错误提示信息
        return NULL;
    }
    float *buf = new float[n];
    if (!buf) { // !buf的意思是当buf为空时执行if里的内容
        cout << "申请分配空间失败" << endl; // 输出错误提示信息
        return NULL;
    }
    cout << "请输入数组，以空格或回车区分: ";
    for (int i = 0; i < n; i++) {
        cin >> buf[i];
    }
    return buf;
}