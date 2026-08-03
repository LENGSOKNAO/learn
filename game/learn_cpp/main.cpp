#include <iostream>
#include "all_phases.h"

void section(const std::string& title) {
    std::cout << "\n========================================\n";
    std::cout << "  " << title << "\n";
    std::cout << "========================================\n\n";
}

int main() {
    section("Phase 1: Variables, Data Types & Operators");
    run_phase1();

    section("Phase 2: Functions and Arrays");
    run_phase2();

    section("Phase 3: OOP - Classes, Inheritance, Polymorphism, Abstraction");
    run_phase3();

    section("Phase 4: Memory Management & Modern C++");
    run_phase4();

    section("All phases completed!");
    return 0;
}