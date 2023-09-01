class Dog{
    static int Dogs;
  public:
    Dog(){
      GetDogs();
    }
    static void GetDogs(){
      ++Dogs;
    }
    static int Display(){
      return Dog::Dogs; 
    }
};
int Dog::Dogs = 0;
#include <iostream>
using namespace std;
int main(){
  Dog One, Two, Three;
  cout << Dog::Display() << endl;
}