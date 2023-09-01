#include <iostream>
#include <fstream>
#include <cstring>
using namespace std;
int main(){
  char ch[16], * p = "abcdefg";
  ofstream myFile;
  myFile.open("myText.txt");  // 可以合并成一条ofstream myFile("myText.txt");
  myFile << p;
  myFile << "GoodBye!";
  myFile.close();
  ifstream getText("myText.txt");
  for (int i = 0; i < strlen(p) + 8; i++)
    getText >> ch[i];
  ch[16] = '\0';
  getText.close();
  cout << ch << endl;
}