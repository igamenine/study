#include <iostream>
#include <fstream>
using namespace std;
struct list{
  double salary;
  char name[20];
  friend istream& operator>>(istream&, list&);
  friend ostream& operator<<(ostream&, list&);
};
istream& operator>>(istream& input, list& ob){
  input >> ob.name;
  input >> ob.salary;
  return input;
}
ostream& operator<<(ostream& output, list& ob){
  output << ob.name << " ";
  output << ob.salary << " ";
  return output;
}
int main(){
  list worker1[2] = {{1256, "LiMing"}, {3467, "ZhangHong"}}, worker2[2];
  ofstream out("pay.txt", ios_base::binary);
  if(!out){
    cout << "没有正确建立文件，结束程序运行！" << endl;
    return 0;
  }
  for (int i = 0; i < 2; i++)
    out << worker1[i];
  out.close();
  ifstream in("pay.txt", ios_base::binary);
  if(!in){
    cout << "没有正确建立文件，结束程序运行！" << endl;
    return 0;
  }
  for (int i = 0; i < 2; i++){
    in >> worker2[i];
    cout << worker2[i] << endl;
  }
  in.close();
}