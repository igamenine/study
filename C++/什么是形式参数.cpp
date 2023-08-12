#include <iostream>

void greet(const std::string& name) {   // 函数greet(name)中的name就是形式参数，值得一提的是函数也称操控符
  std::cout << "Hello, " << name << "!" << std::endl;
}

int main() {
  std::string person = "Alice";
  greet(person);
  return 0;
}