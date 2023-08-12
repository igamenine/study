#include <iostream>
#include <cmath>
using namespace std;

void solve_case1(double a, double b, double c) {
    double x1 = (-b + sqrt(b * b - 4 * a * c)) / (2 * a);
    double x2 = (-b - sqrt(b * b - 4 * a * c)) / (2 * a);
    cout << "The roots are real and different:" << endl;
    cout << "x1 = " << x1 << endl;
    cout << "x2 = " << x2 << endl;
}

void solve_case2(double a, double b, double c) {
    double x = -b / (2 * a);
    cout << "The roots are real and same:" << endl;
    cout << "x1 = x2 = " << x << endl;
}

void solve_case3(double a, double b, double c) {
    double realPart = -b / (2 * a);
    double imaginaryPart = sqrt(4 * a * c - b * b) / (2 * a);
    cout << "The roots are complex and different:" << endl;
    cout << "x1 = " << realPart << "+" << imaginaryPart << "i" << endl;
    cout << "x2 = " << realPart << "-" << imaginaryPart << "i" << endl;
}

int main() {
    double a, b, c, delta;
    cout << "Enter the coefficients a, b and c: ";
    cin >> a >> b >> c;
    cout<<"equation:"<<a<<"x*x"<<"+"<<b<<"x"<<"+"<<c<<"=0"<<endl;
    delta = b * b - 4 * a * c;

    if (delta > 0) {
        solve_case1(a, b, c);
    } else if (delta == 0) {
        solve_case2(a, b, c);
    } else {
        solve_case3(a, b, c);
    }

    return 0;
}