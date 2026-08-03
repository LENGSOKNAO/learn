#include <iostream>
using namespace std;

int main()
{
    // Variables
    string name = "Nita";
    char firstName = 'n';
    bool single = true;
    int age = 20;
    float salary = 200.20f;
    const string email = "example@gamil.com";

    // Operators
    // Arithmetic (+ - * / %)
    // Assignment (= += -= *= /= %= &= |= ^= <<= >>=)
    // Comparison (== != > < >= <=)
    // Logical (&& || !)
    // Increment (++)
    // Decrement (--)
    int a = 400;
    int x = 200;

    cout << a + x << endl;
    cout << a - x << endl;
    cout << a / x << endl;
    cout << a * x << endl;
    cout << a % x << endl;
 
    // Conditions
    if(x > a){
        cout << x ;
    } else if(a == x){
        cout << a << endl << x;
    }
     else{
        cout << a << endl;
    }

    if(a == x){
        if(a > 500){
            cout << a;
        }
    } else{
        cout << x <<endl;
    }

    switch (a)
    {
    case 400:
        cout << a << endl;
        break;
    
    default:
        cout << "error" << endl;
        break;
    }

    // Loops
    for(int i = 0; i < 10; i++){
        cout << i<< endl;
    }

    int w = 0;
    while (w < 10)
    {
        cout << w<<endl;
        w++;
    }
    int d = 0;
    do{
        cout << d <<endl;
        d++;
    } while (d < 10);
         
    return 0;

    
}