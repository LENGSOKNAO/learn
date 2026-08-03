#include <iostream>
#include <string>

class Character {
public:
    std::string name;
    int health;
    int attackPower;

    Character(const std::string& n, int h, int ap)
        : name(n), health(h), attackPower(ap) {
        std::cout << "[Constructor] " << name << " spawned with " << health << " HP\n";
    }

    ~Character() {
        std::cout << "[Destructor] " << name << " has been destroyed\n";
    }

    void attack(Character& target) {
        std::cout << name << " attacks " << target.name
                  << " for " << attackPower << " damage!\n";
        target.health -= attackPower;
        if (target.health < 0) target.health = 0;
        std::cout << target.name << " HP: " << target.health << "\n";
    }

    bool isAlive() const {
        return health > 0;
    }

    void printStats() const {
        std::cout << "=== " << name << " ===\n";
        std::cout << "  HP: " << health << "\n";
        std::cout << "  ATK: " << attackPower << "\n";
    }
};

void run_phase3_classes() {
    std::cout << "--- 1. Class Definition ---\n";
    std::cout << "A class is a user-defined type that bundles data (fields)\n";
    std::cout << "and behavior (methods) into a single unit.\n\n";

    std::cout << "--- 2. Creating Objects (Instantiation) ---\n";
    Character hero("Player", 100, 25);
    Character enemy("Goblin", 50, 10);
    std::cout << "\n";

    std::cout << "--- 3. Accessing Members (Fields and Methods) ---\n";
    hero.printStats();
    std::cout << "\n";
    enemy.printStats();
    std::cout << "\n";

    std::cout << "--- 4. Calling Methods (Behavior) ---\n";
    hero.attack(enemy);
    std::cout << "\n";
    enemy.attack(hero);
    std::cout << "\n";

    std::cout << "--- 5. Object State After Combat ---\n";
    std::cout << hero.name << " alive? " << (hero.isAlive() ? "Yes" : "No") << "\n";
    std::cout << enemy.name << " alive? " << (enemy.isAlive() ? "Yes" : "No") << "\n\n";

    std::cout << "--- 6. Constructors ---\n";
    std::cout << "Hero was created via constructor with name='Player', health=100, atk=25\n";
    std::cout << "Parameters passed at object creation are received by the constructor.\n\n";

    std::cout << "--- 7. Destructors ---\n";
    std::cout << "When hero and enemy go out of scope, destructors are called.\n";
    std::cout << "Use delete for heap objects (shown in phase4/memory.cpp).\n\n";

    std::cout << "--- 8. const Methods ---\n";
    std::cout << "isAlive() and printStats() are marked const because they\n";
    std::cout << "do not modify the object's state.\n";
}