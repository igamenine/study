#include <iostream>
using namespace std;

class complex {
    double real; // 实部
    double imag; // 虚部
public:
    complex(double r = 0, double i = 0): real(r), imag(i) {}
    void display() const {
        cout << real << "+" << imag << "i";
    }
    friend complex add(const complex& a, const complex& b); // 声明友元函数
};

complex add(const complex& a, const complex& b) {
    return complex(a.real + b.real, a.imag + b.imag);
}

int main() {
    complex a(1, 2), b(3, 4);
    complex c = add(a, b);
    a.display(); cout << " + "; b.display(); cout << " = "; c.display(); cout << endl;
    return 0;
}