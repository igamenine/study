#include <iostream>
using namespace std;

int main() {
    int n;
    cout << "请输入动态数组元素的个数：";
    cin >> n;

    // 动态分配内存，创建大小为 n 的整型数组
    int* arr = new int[n];

    // 为数组赋值
    cout << "请输入 " << n << " 个整数：" << endl;
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    // 显示数组的值
    cout << "动态数组的值为：" << endl;
    for (int i = 0; i < n; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    // 删除动态数组
    delete[] arr;

    return 0;
}