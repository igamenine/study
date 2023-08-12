#include <iostream>
using namespace std;
class base{
  private:
    int a, b;
  public:
    ~base(){
      cout << "Destroy..." << a << ", " << b << endl;
    }
    base(int a, int b):b(b), a(a){
      cout << "Initializing..." << a << ", " << b << endl;
    }
};

int main(){
  base a(1, 2);
}