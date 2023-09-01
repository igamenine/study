#include <iostream>
#include <vector>

int main() {
    std::vector<int> vi;
    std::cout << "sizeof(int) = " << sizeof(int) << ", sizeof(vi) = " << sizeof(vi) << std::endl;

    std::vector<double> vd;
    std::cout << "sizeof(double) = " << sizeof(double) << ", sizeof(vd) = " << sizeof(vd) << std::endl;

    std::vector<char> vc;
    std::cout << "sizeof(char) = " << sizeof(char) << ", sizeof(vc) = " << sizeof(vc) << std::endl;

    return 0;
}