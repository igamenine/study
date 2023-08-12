#include <iostream>
using namespace std;

int main(){
int arr[3] = {1, 2, 3};
int* ptr = arr;    // 指向数组首元素的指针
cout << arr[0] << " " << arr[1] << " " << arr[2] << endl;
cout << ptr[0] << " " << ptr[1] << " " << ptr[2] << endl;
cout << arr << " " << arr + 1 << " " << arr + 2 << endl;
cout << * ptr << " " << * ptr + 1 << " " << * ptr + 2 << endl;
cout << &arr << " " << &arr + 1 << " " << &arr + 2 << endl;
cout << & * ptr << " " << & * ptr + 1 << " " << & * ptr + 2 << endl;
cout << &arr[0] << " " << &arr[1] << " " << &arr[2] << endl;
cout << &ptr[0] << " " << &ptr[1] << " " << &ptr[2] << endl;
ptr[1] = 4;
cout << arr[0] << " " << arr[1] << " " << arr[2] << endl;
cout << ptr[0] << " " << ptr[1] << " " << ptr[2] << endl;
cout << arr << " " << arr + 1 << " " << arr + 2 << endl;
cout << * ptr << " " << * ptr + 1 << " " << * ptr + 2 << endl;
cout << &arr << " " << &arr + 1 << " " << &arr + 2 << endl;
cout << &arr[0] << " " << &arr[1] << " " << &arr[2] << endl;
cout << &ptr[0] << " " << &ptr[1] << " " << &ptr[2] << endl;
}

