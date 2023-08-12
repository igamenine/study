#include <iostream>

using namespace std;

int main() {
  int x = 10;
  int y = 0;
  
  try {
    if (y == 0) {
      throw runtime_error("除数为零。"); // 抛出一个runtime_error对象
    }
    
    int result = x / y;
    cout << "结果为：" << result << endl;
  } catch (const exception& e) {
    cout << "发生异常：" << e.what() << endl; // 捕获并处理异常
  }
  
  return 0;
}
