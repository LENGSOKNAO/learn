#include <iostream>

void run_phase1_operators() {
    std::cout << "--- Arithmetic Operators ---\n";
    int a = 10, b = 3;
    std::cout << "a + b = " << a + b << "\n";
    std::cout << "a - b = " << a - b << "\n";
    std::cout << "a * b = " << a * b << "\n";
    std::cout << "a / b = " << a / b << " (integer division)\n";
    std::cout << "a % b = " << a % b << " (modulo/remainder)\n";
    std::cout << "10.0 / 3.0 = " << 10.0 / 3.0 << " (floating division)\n\n";

    std::cout << "--- Assignment Operators ---\n";
    int x = 10;
    x += 5;  std::cout << "x += 5  -> x = " << x << "\n";
    x -= 3;  std::cout << "x -= 3  -> x = " << x << "\n";
    x *= 2;  std::cout << "x *= 2  -> x = " << x << "\n";
    x /= 4;  std::cout << "x /= 4  -> x = " << x << "\n";
    x %= 3;  std::cout << "x %= 3  -> x = " << x << "\n\n";

    std::cout << "--- Comparison Operators ---\n";
    int m = 5, n = 10;
    std::cout << "m == n: " << (m == n) << " (equal)\n";
    std::cout << "m != n: " << (m != n) << " (not equal)\n";
    std::cout << "m <  n: " << (m < n) << " (less than)\n";
    std::cout << "m >  n: " << (m > n) << " (greater than)\n";
    std::cout << "m <= n: " << (m <= n) << " (less or equal)\n";
    std::cout << "m >= n: " << (m >= n) << " (greater or equal)\n\n";

    std::cout << "--- Logical Operators ---\n";
    bool p = true, q = false;
    std::cout << "p && q: " << (p && q) << " (AND - both must be true)\n";
    std::cout << "p || q: " << (p || q) << " (OR  - at least one true)\n";
    std::cout << "!p: " << (!p) << " (NOT - flips the value)\n";
    std::cout << "!q: " << (!q) << "\n\n";

    std::cout << "--- Increment / Decrement Operators ---\n";
    int i = 5;
    std::cout << "i = " << i << "\n";
    std::cout << "i++ (post-increment) returns " << i++ << ", then i = " << i << "\n";
    std::cout << "++i (pre-increment)  i = " << ++i << ", returns " << i << "\n";
    std::cout << "i-- (post-decrement) returns " << i-- << ", then i = " << i << "\n";
    std::cout << "--i (pre-decrement)  i = " << --i << ", returns " << i << "\n\n";

    std::cout << "--- Ternary (Conditional) Operator ---\n";
    int age = 18;
    std::string result = (age >= 18) ? "Adult" : "Minor";
    std::cout << "age " << age << " is " << result << "\n\n";
}