#include <iostream>
#include <iomanip>
#include <cstdlib>  // exit()
using namespace std;
class iArray{
    int _size;
    int * data;
  public:
    iArray(int);
    int& operator[](int);
    int size() const{
      return _size;
    }
    ~iArray(){
      delete[] data;
    }
};
iArray::iArray(int n){
  if(n < 1){
    cout << "Error dimension description" << endl;
    exit(1);
  }
  _size = n;
  data = new int[_size];
}
int& iArray::operator[](int i){
  if(i < 0 || (i - _size) > -1){
    cout << "Subscript out of range" << endl;
    delete[] data;
    exit(1);
  }
  return data[i];
}
int main(){
  iArray a(10); // a(0)则触发"Error dimension description"
  cout << "Array num is " << a.size() << endl;
  for (int i = 0; i < a.size(); i++)  // i < a.sze() + 1则触发"Subscript out of range"
    a[i] = 10 * (i + 1);
  for (int i = 0; i < a.size(); i++)
    cout << setw(5) << a[i];
  cout << endl;
}