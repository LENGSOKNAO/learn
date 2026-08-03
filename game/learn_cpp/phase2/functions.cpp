#include <iostream>
#include <string>

int add(int a, int b) {
    return a + b;
}

double add(double a, double b) {
    return a + b;
}

void greet(const std::string& name) {
    std::cout << "Hello, " << name << "!\n";
}

int calculate(int x, int y, char op) {
    switch (op) {
        case '+': return x + y;
        case '-': return x - y;
        case '*': return x * y;
        case '/': return (y != 0) ? x / y : 0;
        default:  return 0;
    }
}

int& increment(int& ref) {
    ref++;
    return ref;
}

void run_phase2_arrays();

void run_phase2_functions() {
    std::cout << "--- 1. Function Basics ---\n";
    int result = add(3, 4);
    std::cout << "add(3, 4) = " << result << "\n\n";

    std::cout << "--- 2. Function Declaration (prototype) ---\n";
    std::cout << "Declared as: int add(int a, int b);\n";
    std::cout << "Defined below. The declaration allows calling before definition.\n\n";

    std::cout << "--- 3. Function Definition ---\n";
    std::cout << "The actual body of the function where logic lives.\n";
    std::cout << "int add(int a, int b) { return a + b; }\n\n";

    std::cout << "--- 4. Parameters and Arguments ---\n";
    std::cout << "Parameters: variables in the function declaration (a, b)\n";
    std::cout << "Arguments: actual values passed when calling (3, 4)\n";
    greet("Player");
    greet("Enemy");
    std::cout << "\n";

    std::cout << "--- 5. Return Values ---\n";
    std::cout << "add(3, 4) returns " << add(3, 4) << "\n";
    greet("Alice");
    std::cout << "greet() returns nothing (void)\n\n";

    std::cout << "--- 6. void Functions ---\n";
    greet("Bob");
    greet("They do not return a value.\n");
    std::cout << "\n";

    std::cout << "--- 7. Function Overloading ---\n";
    std::cout << "add(int, int) = " << add(3, 4) << "\n";
    std::cout << "add(double, double) = " << add(3.5, 4.2) << "\n";
    std::cout << "Same name, different parameter types.\n\n";

    std::cout << "--- 8. Pass by Value ---\n";
    int val = 10;
    std::cout << "Before passByValue: val = " << val << "\n";
    auto passByValue = [](int v) { v = 99; };
    passByValue(val);
    std::cout << "After passByValue:  val = " << val << " (unchanged!)\n\n";

    std::cout << "--- 9. Pass by Reference ---\n";
    int val2 = 10;
    std::cout << "Before passByReference: val2 = " << val2 << "\n";
    auto passByReference = [](int& v) { v = 99; };
    passByReference(val2);
    std::cout << "After passByReference:  val2 = " << val2 << " (changed!)\n";
    std::cout << "Reference is an alias for the original variable.\n\n";

    std::cout << "--- 10. Pass by Pointer (alternative) ---\n";
    int val3 = 10;
    auto passByPointer = [](int* ptr) { *ptr = 99; };
    std::cout << "Before passByPointer: val3 = " << val3 << "\n";
    passByPointer(&val3);
    std::cout << "After passByPointer:  val3 = " << val3 << "\n\n";

    std::cout << "--- 11. Calculate with switch ---\n";
    std::cout << "calculate(10, 5, '+') = " << calculate(10, 5, '+') << "\n";
    std::cout << "calculate(10, 5, '-') = " << calculate(10, 5, '-') << "\n";
    std::cout << "calculate(10, 5, '*') = " << calculate(10, 5, '*') << "\n";
    std::cout << "calculate(10, 5, '/') = " << calculate(10, 5, '/') << "\n\n";
}