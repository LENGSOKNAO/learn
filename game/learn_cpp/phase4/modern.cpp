#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <cmath>

void run_phase4_memory();

enum class Direction {
    North,
    South,
    East,
    West
};

enum class Color : uint8_t {
    Red = 1,
    Green = 2,
    Blue = 3
};

struct Vec3 {
    float x, y, z;

    Vec3(float x = 0, float y = 0, float z = 0) : x(x), y(y), z(z) {}

    Vec3 operator+(const Vec3& other) const {
        return {x + other.x, y + other.y, z + other.z};
    }
};

struct PlayerData {
    std::string name;
    int score;
    Direction facing;
};

namespace GameUtils {
    float distance(float x1, float y1, float x2, float y2) {
        float dx = x2 - x1;
        float dy = y2 - y1;
        return std::sqrt(dx * dx + dy * dy);
    }

    void printDirection(Direction dir) {
        switch (dir) {
            case Direction::North: std::cout << "North\n"; break;
            case Direction::South: std::cout << "South\n"; break;
            case Direction::East:  std::cout << "East\n"; break;
            case Direction::West:  std::cout << "West\n"; break;
        }
    }
}

void run_phase4_modern() {
    std::cout << "--- 1. const ---\n";
    const int MAX_AMMO = 30;
    const double GRAVITY = 9.8;
    std::cout << "MAX_AMMO = " << MAX_AMMO << " (cannot be changed)\n";
    std::cout << "GRAVITY = " << GRAVITY << "\n";

    const int* ptr = &MAX_AMMO;
    int value = 10;
    const int& ref = value;
    std::cout << "const pointer, const ref: values cannot be modified through them.\n\n";

    std::cout << "--- 2. auto ---\n";
    auto i = 42;
    auto d = 3.14;
    auto s = std::string("hello");
    auto v = std::vector<int>{1, 2, 3};
    std::cout << "auto types are deduced at compile time.\n";
    std::cout << "i = " << i << ", d = " << d << ", s = " << s << "\n";

    const auto& item = v[0];
    std::cout << "First item (auto const ref): " << item << "\n\n";

    std::cout << "--- 3. enum class (scoped enum) ---\n";
    Direction dir = Direction::North;
    GameUtils::printDirection(dir);
    std::cout << "enum class prevents implicit conversion to int.\n";
    std::cout << "Direction::North (not just North - scoped).\n";
    std::cout << "Underlying type: " << static_cast<int>(Direction::East) << "\n\n";

    std::cout << "--- 4. struct ---\n";
    std::cout << "structs in C++ are classes with public members by default.\n";
    Vec3 position(1.0f, 2.0f, 3.0f);
    Vec3 velocity(0.1f, 0.0f, -0.5f);
    Vec3 newPos = position + velocity;
    std::cout << "New position: (" << newPos.x << ", " << newPos.y << ", " << newPos.z << ")\n";

    PlayerData pd;
    pd.name = "Hero";
    pd.score = 1500;
    pd.facing = Direction::South;
    std::cout << "Player: " << pd.name << " Score: " << pd.score << "\n";
    GameUtils::printDirection(pd.facing);
    std::cout << "\n";

    std::cout << "--- 5. namespace ---\n";
    std::cout << "GameUtils:: distance function: ";
    std::cout << GameUtils::distance(0, 0, 3, 4) << "\n";
    std::cout << "Namespaces prevent name collisions.\n";
    std::cout << "In UE: UNamespace, FName, etc. all use namespaces.\n\n";

    std::cout << "--- 6. Lambda Functions ---\n";
    auto add = [](int a, int b) { return a + b; };
    std::cout << "add(3, 4) = " << add(3, 4) << "\n";

    auto greeter = [](const std::string& name) {
        std::cout << "Hello, " << name << "!\n";
    };
    greeter("Player");

    auto counter = []() {
        int count = 0;
        return [count]() mutable -> int {
            return ++count;
        };
    }();
    std::cout << "Counter: " << counter() << "\n";
    std::cout << "Counter: " << counter() << "\n";
    std::cout << "Counter: " << counter() << "\n\n";

    std::cout << "--- Lambda with capture ---\n";
    int bonus = 100;
    auto scoreWithBonus = [bonus](int base) { return base + bonus; };
    std::cout << "scoreWithBonus(50) = " << scoreWithBonus(50) << "\n";

    auto mutate = [&bonus]() { bonus *= 2; };
    mutate();
    std::cout << "After mutation, bonus = " << bonus << "\n";
    std::cout << "scoreWithBonus(50) = " << scoreWithBonus(50) << "\n\n";

    std::cout << "--- Lambda with std::vector ---\n";
    std::vector<int> nums = {1, 2, 3, 4, 5};
    int sum = 0;
    for_each(nums.begin(), nums.end(), [&sum](int n) { sum += n; });
    std::cout << "Sum of nums: " << sum << "\n";

    auto evens = nums;
    evens.erase(
        std::remove_if(evens.begin(), evens.end(), [](int n) { return n % 2 != 0; }),
        evens.end()
    );
    std::cout << "Even numbers: ";
    for (auto n : evens) std::cout << n << " ";
    std::cout << "\n\n";

    std::cout << "--- Lambda in UE context ---\n";
    std::cout << "Lambdas are used extensively in UE for delegates:\n";
    std::cout << "  OnActorBeginOverlap.AddLambda([](AActor* Self, AActor* Other) {\n";
    std::cout << "      // handle overlap\n";
    std::cout << "  });\n";
}