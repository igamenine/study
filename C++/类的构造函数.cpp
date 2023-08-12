#include <iostream>
using namespace std;

class Rectangle {
public:
    Rectangle(); // 构造函数声明
    Rectangle(int w, int h); // 带参数的构造函数声明
    int area(); // 成员函数声明

private:
    int width, height; // 数据成员
};

Rectangle::Rectangle() { // 默认构造函数实现
    width = 0;
    height = 0;
}

Rectangle::Rectangle(int w, int h) { // 带参数的构造函数实现
    width = w;
    height = h;
}

int Rectangle::area() { // 计算面积的成员函数实现
    return width * height;
}

int main() {
    Rectangle rect1; // 调用默认构造函数
    Rectangle rect2(3, 4); // 调用带参数的构造函数

    cout << "rect1的面积为：" << rect1.area() << endl;
    cout << "rect2的面积为：" << rect2.area() << endl;

    return 0;
}