#include <iostream>
#include<cstdio>
#include<cstdlib>
using namespace std;

int main()
{
  int a,b,c;
  a = 10;
  b = 20;
  c = 30;

#if 1
 printf("a+b = %d",a+b);
#else
 printf("b+c = %d",b+c);
#endif
cout << endl;
return 0;
}