#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    cout << "max(ABC, ABD) = " << max("ABC", "ABD") << endl;
    string s1 = "ABC";
    string s2 = "ABD";
    cout << "max of " << s1 << " and " << s2 << " is " << max(s1, s2) << endl;
}