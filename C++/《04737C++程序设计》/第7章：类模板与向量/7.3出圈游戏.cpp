#include <iostream>
#include <vector>
#include <cstdio> // getchar()
#include <cstring> // strcpy()
#include <stdio.h>  // fgets()
using namespace std;
class SeqList{
    char name[10];
  public:
    void DispName(){
      cout << name;
    }
    void SetName(char b[]){
      strcpy(name, b);  // 字符赋值函数strcpy
    }
    void Joseph(vector<SeqList> &);
};
void SeqList::Joseph(vector <SeqList> & c){
  int m, star, i, j, k; // m是间隔数，star是起始位置，i是人数，j是报数，k是循环次数
  cout << "请输入间隔数m(m <= 20)：";
  cin >> m;
  while (m > 20){
    cout << "间隔太大，请重新输入：";
    cin >> m;
  }
  cout << "从第几个人的位置开始报数（不能大于" << c.size() << "）：";
  cin >> star;
  while (star > c.size()){
    cout << "开始位置大于人数，请重新输入：";
    cin >> star;
  }
  cout << "准备输入名字" << endl;
  getchar();  // 消除回车干扰
  char s[10];
  for (i = 0; i < c.size(); i++){
    cout << "第" << i + 1 << "个人的名字：";
    cin >> s;
   c[i].SetName(s);
  }
  i = star - 2; // 为方便编程，从规定开始报数处再减1作为计数依据
  vector<SeqList>::iterator p;
  p = c.begin();
  int length = c.size();
  for (k = 1; k <= length; k++){
    j = 0;  // 报数
    while (j < m){
      i++;
      if (i == c.size())  // 到终点，返回第一个位置计数
        i = 0;
      j++;
    }
    if (k == length)
      break;
    c[i].DispName();  // 输出出圈人的姓名
    cout << ", ";
    c.erase(p + i); // 删除出圈人记录
    --i;  // 调整计数位置初始值
  }
  // break语句跳转至此处，输出最后出列的编号
  c[i].DispName();
  cout << endl;
}
int main(){
  int length = 0;
  cout << "请输入人数：";
  cin >> length;
  vector<SeqList> c(length);  // 建立向量c
  SeqList game; // 建立类SeqList对象game
  game.Joseph(c); // 调用成员函数Joseph求解
}