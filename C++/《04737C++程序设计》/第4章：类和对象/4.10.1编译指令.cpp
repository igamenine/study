#include <iostream>
using namespace std;
// #define DEBUG  // 允许不定义替换文本，但下文不允许将DEBUG输出或作为右值或左值。
#define DEBUG 555 // 本代码测试目的给DEBUG赋值，但平时不会给DEBUG赋值。

#ifndef DEBUG // 如果DEBUG不存在则在编译时会输出#error "ERROR!"并结束编译，否则继续编译
#error "ERROR!"
#endif

int main(){
  // DEBUG = 555; // 不允许这样给宏定义赋值。
  int i = DEBUG;
  #if defined(DEBUG)
    cout << "#if defined(DEBUG) : " << i << endl;
  #endif
  #ifdef DEBUG
    cout << "#ifdef DEBUG : " << i << endl;
  #endif
cout << "#undef DEBUG" << endl;
#undef DEBUG
  #if defined(DEBUG)
    cout << "if defined(DEBUG) : " << i << endl;
  #error "DEBUG is deleded, creating..."
  #else
    cout <<  "DEBUG is deleded, creating..." << endl;
    #define DEBUG
  #endif
  #ifndef DEBUG
    cout << "No! " << endl;
  #else
    cout << "ifndef DEBUG : " << i << endl;
  #endif
}