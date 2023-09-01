#include <iostream>
#include <cmath>
#include <limits>

class Line {
private:
    double k; // 直线斜率
    double b; // 直线截距

public:
    inline Line(double slope = 0.0, double intercept = 0.0) : k(slope), b(intercept) {}

    inline void SetLine(double slope, double intercept) {
        k = slope;
        b = intercept;
    }

    inline double GetSlope() const { return k; }
    inline double GetIntercept() const { return b; }

    void Print() const {
        std::cout << "直线的解析式为：y = " << k << "x + " << b << std::endl;
        if (k == 0.0) {
            std::cout << "该直线垂直于 x 轴" << std::endl;
        } else if (std::isinf(k)) {
            std::cout << "该直线垂直于 y 轴" << std::endl;
        } else {
            std::cout << "该直线的斜率为：" << k << std::endl;
            std::cout << "该直线与 x 轴的交点为：(" << -b / k << ", 0)" << std::endl;
            std::cout << "该直线与 y 轴的交点为：(0, " << b << ")" << std::endl;
        }
    }
};

int main() {
    double slope, intercept;
    std::cout << "请输入直线的斜率和截距（用空格分隔）：";
    std::cin >> slope >> intercept;

    Line line(slope, intercept);
    line.Print();

    return 0;
}