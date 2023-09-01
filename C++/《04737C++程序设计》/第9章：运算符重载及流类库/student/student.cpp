#include "student.h"
void student::set(vector<student>&c){ // 输入信息并存入向量和文件中
  student a;  // 定义对象a作为数据临时存储
  string s; // 定义临时存储输入学号的对象
  double b; // 定义临时存储输入成绩的对象
  while(1){
    cout << "numer: ";
    cin >> s;
    if(s == "0"){ // 当s为0时将结果存入文件并结束循环
      ofstream output("stud.txt");
      if(!output){
        cout << "没有正确建立文件！" << endl;
        return;
      }
      for (int i = 0; i < c.size(); i++)
        output << c[i].number << " " << c[i].score << " ";
      output.close();
      cout << "一共写入" << c.size() << "个学生信息" << endl;
      return;
    }
    a.SetNum(s);
    cout << "score: ";
    cin >> b;
    a.Setscore(b);
    c.push_back(a);
  }
}
void student::display(vector<student>&c){ // 显示向量信息
  cout << "number" << setw(19) << "score" << endl;
  for (int i = 0; i < c.size(); i++)
    cout << c[i].GetNum() << setw(12) << c[i].GetScore() << endl;
}
void student::read(){  // 读入文件内容
  string number;
  double score;
  ifstream input("stud.txt");
  if(!input){
    cout << "文件打不开！" << endl;
    return;
  }
  cout << "number" << setw(19) << "score" << endl;
  while(1){
    input >> number >> score;
    if(input.eof()){
      input.close();
      return;
    }
    cout << number << setw(12) << score << endl;
  }
}
int main(){
  vector<student> st; // 向量st的数据类型为student
  student stud;
  stud.set(st); // stud调用成员函数set接受输入并建立文件
  cout << "display:" << endl;
  stud.display(st);
  cout << "read:" << endl;
  stud.read();
}