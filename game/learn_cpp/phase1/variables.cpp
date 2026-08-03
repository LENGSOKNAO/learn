#include <iostream>
#include <string>
#include <limits>

void run_phase1_operators();
void run_phase1_conditions();
void run_phase1_loops();

void run_phase1() {
    std::cout << "--- 1. Variables ---\n";
    int age = 25;
    double price = 9.99;
    char grade = 'A';
    bool isActive = true;
    std::string name = "Hero";

    std::cout << "age = " << age << "\n";
    std::cout << "price = " << price << "\n";
    std::cout << "grade = " << grade << "\n";
    std::cout << "isActive = " << isActive << "\n";
    std::cout << "name = " << name << "\n\n";

    std::cout << "--- 2. Constants ---\n";
    const int MAX_HEALTH = 100;
    constexpr double PI = 3.14159265358979;
    std::cout << "MAX_HEALTH = " << MAX_HEALTH << "\n";
    std::cout << "PI = " << PI << "\n\n";

    std::cout << "--- 3. Data Types ---\n";
    std::cout << "int size: " << sizeof(int) << " bytes\n";
    std::cout << "float size: " << sizeof(float) << " bytes\n";
    std::cout << "double size: " << sizeof(double) << " bytes\n";
    std::cout << "char size: " << sizeof(char) << " bytes\n";
    std::cout << "bool size: " << sizeof(bool) << " bytes\n";
    std::cout << "string is not a built-in type (it is a class)\n\n";

    std::cout << "--- 4. int ---\n";
    int a = 42;
    int b = -10;
    unsigned int u = 2000000000;
    std::cout << "a = " << a << ", b = " << b << ", u = " << u << "\n\n";

    std::cout << "--- 5. float ---\n";
    float f1 = 3.14f;
    float f2 = 1.0f / 3.0f;
    std::cout << "f1 = " << f1 << ", f2 = " << f2 << "\n";
    std::cout << "Note: float has ~7 decimal digits of precision\n\n";

    std::cout << "--- 6. double ---\n";
    double d1 = 3.14159265358979;
    double d2 = 1.0 / 3.0;
    std::cout << "d1 = " << d1 << ", d2 = " << d2 << "\n";
    std::cout << "Note: double has ~15 decimal digits of precision\n\n";

    std::cout << "--- 7. char ---\n";
    char c = 'Z';
    std::cout << "c = " << c << ", ASCII value = " << static_cast<int>(c) << "\n\n";

    std::cout << "--- 8. bool ---\n";
    bool flag1 = true;
    bool flag2 = false;
    std::cout << "flag1 = " << flag1 << ", flag2 = " << flag2 << "\n\n";

    std::cout << "--- 9. string ---\n";
    std::string greeting = "Hello, C++!";
    std::cout << "greeting = " << greeting << "\n";
    std::cout << "length = " << greeting.length() << "\n";
    std::cout << "first char = " << greeting[0] << "\n\n";

    std::cout << "--- 10. Type Conversion ---\n";
    int intVal = 7;
    double dblVal = 2.5;
    std::cout << "int + double = " << intVal + dblVal << "\n";
    std::cout << "int / int = " << intVal / 3 << " (integer division)\n";
    std::cout << "static_cast<double>(intVal) / 3 = " << static_cast<double>(intVal) / 3 << "\n";
    std::cout << "static_cast<int>(dblVal) = " << static_cast<int>(dblVal) << " (truncates)\n";
    std::cout << "int to string: " << std::to_string(intVal) + "100" << "\n";
    std::cout << "string to int: " << std::stoi("42") + 1 << "\n";

    run_phase1_operators();
    run_phase1_conditions();
    run_phase1_loops();
}