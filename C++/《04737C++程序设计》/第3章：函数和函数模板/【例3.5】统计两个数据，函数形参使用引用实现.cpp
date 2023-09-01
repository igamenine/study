#include <iostream>
using namespace std;
typedef double array[12]; // 数组不能被直接引用，所以需要声明typedef
void avecount(array &, int);  // 声明调用函数1
void avecount_point(double [], int);  // 声明调用函数2
int main(){
  array b = {12, 34, 56, 78, 90, 98, 76, 85, 64, 43};
  array &a = b;
  avecount(a, 12);
  cout << "使用typedef引用数组" << endl;
  cout << "平均成绩为" << a[10] << "分，不及格人数有" << a[11] << "人。" << endl;
  avecount_point(b, 12);
  cout << "使用指针引用数组" << endl;
  cout << "平均成绩为" << a[10] << "分，不及格人数有" << a[11] << "人。" << endl;
}
void avecount(array& b, int n){ // 一个参数使用引用，一个参数使用对象
  double ave(0);
  int count(0);
  for (int j = 0; j < n-2; j++){
    ave = ave + b[j];
    if(b[j] < 60)
      count ++;
  }
  b[n-2] = ave/(n-2); //往位置n-2填入平均成绩
  b[n-1] = count; //往位置n-1填入不及格人数
}

void avecount_point(double b[], int n){
  double * p = b, ave(0), count(0);
  for (int j = 0; j < n-2; j++){
    ave = ave + p[j];
    if(p[j] < 60)
      count ++;
  }
  p[n-2] = ave/(n-2);
  p[n-1] = count;
}