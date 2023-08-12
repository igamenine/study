#include <iostream>
using namespace std;

char san(char C, int N){
  for (int i = 0; i < N; i++){
    for (int j = 0; j <= i; j++){
      cout << C;
    }
    cout << endl;
  }
  return 0;
}
int main(){
  char C;
  int N;
  cout << "请输入字符C和整数N：";
  cin >> C >> N;
  ::san(C, N);
  return 0;
}