#include <iostream>
#include <vector>
#include <array>

void run_phase2_functions();

void run_phase2_arrays() {
    std::cout << "--- 1. Arrays ---\n";
    int numbers[5] = {10, 20, 30, 40, 50};
    std::cout << "numbers[0] = " << numbers[0] << "\n";
    std::cout << "numbers[2] = " << numbers[2] << "\n";
    std::cout << "numbers[4] = " << numbers[4] << "\n\n";

    std::cout << "--- 2. Array Index (0-based) ---\n";
    for (int i = 0; i < 5; ++i) {
        std::cout << "numbers[" << i << "] = " << numbers[i] << "\n";
    }
    std::cout << "\n";

    std::cout << "--- 3. Loop Through Arrays ---\n";
    for (int i = 0; i < 5; ++i) {
        std::cout << numbers[i] << " ";
    }
    std::cout << "\n";
    std::cout << "Range-based loop (C++11):\n";
    for (int n : numbers) {
        std::cout << n << " ";
    }
    std::cout << "\n\n";

    std::cout << "--- 4. Array Size ---\n";
    int size = sizeof(numbers) / sizeof(numbers[0]);
    std::cout << "Array has " << size << " elements\n\n";

    std::cout << "--- 5. Multi-Dimensional Arrays ---\n";
    int grid[3][3] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    std::cout << "3x3 grid:\n";
    for (int row = 0; row < 3; ++row) {
        for (int col = 0; col < 3; ++col) {
            std::cout << grid[row][col] << "\t";
        }
        std::cout << "\n";
    }
    std::cout << "\n";

    std::cout << "--- 6. std::vector (dynamic array) ---\n";
    std::vector<int> vec;
    vec.push_back(100);
    vec.push_back(200);
    vec.push_back(300);
    vec.push_back(400);
    vec.push_back(500);
    std::cout << "vector size: " << vec.size() << "\n";
    std::cout << "vector elements: ";
    for (const auto& v : vec) {
        std::cout << v << " ";
    }
    std::cout << "\n";
    std::cout << "vec[0] = " << vec[0] << "\n";
    std::cout << "vec.back() = " << vec.back() << "\n";
    std::cout << "vec.pop_back() removes " << vec.back() << "\n";
    vec.pop_back();
    std::cout << "After pop_back, size = " << vec.size() << "\n";
    std::cout << "\n";

    std::cout << "--- 7. std::vector initialization shortcuts ---\n";
    std::vector<int> vec2 = {1, 2, 3, 4, 5};
    std::vector<int> vec3(10, 0);
    std::vector<std::string> names = {"Hero", "Mage", "Warrior"};
    std::cout << "vec2 size = " << vec2.size() << "\n";
    std::cout << "vec3 size = " << vec3.size() << " (all zeros)\n";
    std::cout << "names: ";
    for (const auto& name : names) {
        std::cout << name << " ";
    }
    std::cout << "\n\n";

    std::cout << "--- 8. std::array (fixed-size, safer than C-array) ---\n";
    std::array<int, 5> arr = {11, 22, 33, 44, 55};
    std::cout << "arr size = " << arr.size() << "\n";
    std::cout << "arr.at(2) = " << arr.at(2) << " (bounds-checked)\n";
    std::cout << "arr[3] = " << arr[3] << " (unchecked, faster)\n";
    std::cout << "arr.front() = " << arr.front() << "\n";
    std::cout << "arr.back() = " << arr.back() << "\n";
    std::cout << "arr.empty() = " << arr.empty() << "\n\n";

    std::cout << "--- 9. Vector of vectors (2D) ---\n";
    std::vector<std::vector<int>> matrix = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    for (const auto& row : matrix) {
        for (const auto& cell : row) {
            std::cout << cell << "\t";
        }
        std::cout << "\n";
    }
}

void run_phase2_arrays();

void run_phase2() {
    run_phase2_functions();
    run_phase2_arrays();
}