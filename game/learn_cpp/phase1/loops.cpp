#include <iostream>

void run_phase1_loops() {
    std::cout << "--- for Loop ---\n";
    for (int i = 1; i <= 5; ++i) {
        std::cout << "Iteration " << i << "\n";
    }
    std::cout << "\n";

    std::cout << "--- for Loop: counting down ---\n";
    for (int i = 10; i >= 1; --i) {
        std::cout << i << " ";
    }
    std::cout << "\n\n";

    std::cout << "--- for Loop: range-based (C++11) ---\n";
    const char* fruits[] = {"Apple", "Banana", "Cherry"};
    for (const auto& fruit : fruits) {
        std::cout << fruit << " ";
    }
    std::cout << "\n\n";

    std::cout << "--- while Loop ---\n";
    int count = 1;
    while (count <= 5) {
        std::cout << "count = " << count << "\n";
        ++count;
    }
    std::cout << "\n";

    std::cout << "--- do...while Loop (always runs at least once) ---\n";
    int num = 1;
    do {
        std::cout << "num = " << num << " (runs at least once even if condition is false)\n";
    } while (num > 10);
    std::cout << "\n";

    std::cout << "--- break Statement ---\n";
    for (int i = 1; i <= 10; ++i) {
        if (i == 5) {
            std::cout << "Hit 5, breaking out of loop!\n";
            break;
        }
        std::cout << "i = " << i << "\n";
    }
    std::cout << "\n";

    std::cout << "--- continue Statement ---\n";
    for (int i = 1; i <= 5; ++i) {
        if (i == 3) {
            std::cout << "Skipping 3\n";
            continue;
        }
        std::cout << "i = " << i << "\n";
    }
    std::cout << "\n";

    std::cout << "--- Nested Loops (multiplication table) ---\n";
    for (int row = 1; row <= 3; ++row) {
        for (int col = 1; col <= 3; ++col) {
            std::cout << row << " x " << col << " = " << (row * col) << "\t";
        }
        std::cout << "\n";
    }
    std::cout << "\n";

    std::cout << "--- Nested Loops: triangle pattern ---\n";
    for (int i = 1; i <= 4; ++i) {
        for (int j = 1; j <= i; ++j) {
            std::cout << "* ";
        }
        std::cout << "\n";
    }
    std::cout << "\n";

    std::cout << "--- while + break + continue combo ---\n";
    int value = 0;
    while (true) {
        ++value;
        if (value == 3) continue;
        if (value == 7) break;
        std::cout << "value = " << value << "\n";
    }
}