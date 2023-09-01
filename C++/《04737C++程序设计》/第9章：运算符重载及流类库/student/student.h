#if !defined(STUDENT_H)
#define STUDENT_H
#include <iostream>
#include <string>
#include <iomanip>
#include <vector>
#include <fstream>
using namespace std;
class student{
    string number;
    double score;
  public:
    void SetNum(string s){
      number = s;
    }
    void Setscore(double s){
      score = s;
    }
    string GetNum(){
      return number;
    }
    double GetScore(){
      return score;
    }
    void set(vector<student>&); // 输入信息并存入向量和文件中
    void display(vector<student>&); // 显示向量信息
    void read();  // 读入文件内容
};
#endif